import 'package:drift/drift.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/fast_hash.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/failures/template_failure.dart';
import 'package:jumpat/features/workout/domain/repositories/i_template_repository.dart';

part 'template_repository.g.dart';

@DriftAccessor(tables: [Templates, Exercises])
class TemplateRepository extends DatabaseAccessor<AppDatabase>
    with _$TemplateRepositoryMixin
    implements ITemplateRepository {
  TemplateRepository({required this.db}) : super(db);
  final AppDatabase db;

  @override
  Future<Either<TemplateFailure, Unit>> save(TemplateEntity template) async {
    await db.writeTxn(
      () async {
        final t = TemplateEntityConverter().toInfra(template);
        await db.templates.put(t);
        await t.exercises.save();
      },
    );
    return right(unit);
  }

  @override
  Future<IList<TemplateEntity>> getAll() async {
    final templates = await db.templates.where().findAll();
    return templates.map(TemplateEntityConverter().toDomain).toIList();
  }

  @override
  Future<Option<TemplateEntity>> get(UniqueId id) async {
    final template = await db.templates.get(fastHash(id.getOrCrash()));
    return Option.fromNullable(template)
        .map(TemplateEntityConverter().toDomain);
  }

  @override
  Future<Either<TemplateFailure, Unit>> remove(TemplateEntity template) async {
    await db.writeTxn(
      () async => db.templates.delete(fastHash(template.id.getOrCrash())),
    );
    return right(unit);
  }
}
