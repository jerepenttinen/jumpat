import 'package:drift/drift.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/failures/template_failure.dart';
import 'package:jumpat/features/workout/domain/repositories/i_template_repository.dart';
import 'package:jumpat/features/workout/infrastructure/aggregates/aggregates.dart';
import 'package:jumpat/features/workout/infrastructure/converters/template_converter.dart';

part 'template_repository.g.dart';

@DriftAccessor(tables: [Templates, Exercises, TemplatesExercises])
class TemplateRepository extends DatabaseAccessor<AppDatabase>
    with _$TemplateRepositoryMixin
    implements ITemplateRepository {
  TemplateRepository({required this.db}) : super(db);
  final AppDatabase db;

  @override
  Future<Either<TemplateFailure, Unit>> save(TemplateEntity template) async {
    final aggregate = TemplateConverter().toModel(template);

    await db.transaction(() async {
      await db.into(templates).insertOnConflictUpdate(aggregate.template);
      await batch((batch) {
        batch.insertAllOnConflictUpdate(exercises, aggregate.exercises);
      });
    });

    return right(unit);
  }

  @override
  Future<IList<TemplateEntity>> getAll() async {
    final template = await select(templates).get();

    final idToTemplate = {for (var t in template) t.id: t};
    final ids = idToTemplate.keys;

    final exerciseQuery = await (select(templatesExercises).join([
      innerJoin(exercises, exercises.id.equalsExp(templatesExercises.exercise)),
    ])
          ..where(templatesExercises.template.isIn(ids)))
        .get();

    final idToExercises = <int, List<Exercise>>{};

    for (final row in exerciseQuery) {
      final exercise = row.readTable(exercises);
      final id = row.readTable(templatesExercises).template;
      idToExercises.putIfAbsent(id, () => []).add(exercise);
    }

    return [
      for (final id in ids)
        TemplateAggregate(
          template: idToTemplate[id]!,
          exercises: IList(idToExercises[id] ?? <Exercise>[]),
        )
    ].map(TemplateConverter().toDomain).toIList();
  }

  @override
  Future<Option<TemplateEntity>> get(UniqueId id) async {
    final template = await (select(templates)
          ..where((template) => template.id.equals(id.getOrCrash())))
        .getSingleOrNull();

    if (template == null) {
      return none();
    }

    final exerciseQuery = await (select(templatesExercises).join([
      innerJoin(exercises, exercises.id.equalsExp(templatesExercises.exercise)),
    ])
          ..where(templatesExercises.template.equals(id.getOrCrash())))
        .get();

    final exs = exerciseQuery.map((row) => row.readTable(exercises)).toIList();

    return some(
      TemplateConverter().toDomain(
        TemplateAggregate(template: template, exercises: exs),
      ),
    );
  }

  @override
  Future<Either<TemplateFailure, Unit>> remove(TemplateEntity template) async {
    await (delete(templates)
          ..where((tbl) => tbl.id.equals(template.id.getOrCrash())))
        .go();

    return right(unit);
  }
}
