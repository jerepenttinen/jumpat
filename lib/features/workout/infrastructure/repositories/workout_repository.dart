import 'package:drift/drift.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/fast_hash.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/failures/workout_failure.dart';
import 'package:jumpat/features/workout/domain/repositories/i_workout_repository.dart';
import 'package:jumpat/features/workout/infrastructure/aggregates/aggregates.dart';
import 'package:jumpat/features/workout/infrastructure/converters/template_converter.dart';
import 'package:jumpat/features/workout/infrastructure/converters/workout_converter.dart';

part 'workout_repository.g.dart';

@DriftAccessor(tables: [Workouts, Templates, TemplatesExercises])
class WorkoutRepository extends DatabaseAccessor<AppDatabase>
    with _$WorkoutRepositoryMixin
    implements IWorkoutRepository {
  WorkoutRepository({required this.db}) : super(db);
  final AppDatabase db;

  @override
  Future<Either<WorkoutFailure, Unit>> remove(WorkoutEntity workout) async {
    await (delete(workouts)
          ..where((tbl) => tbl.id.equals(workout.id.getOrCrash())))
        .go();

    return right(unit);
  }

  @override
  Future<IList<WorkoutEntity>> getAll() async {
    final query = select(workouts).join(
      [leftOuterJoin(templates, templates.id.equalsExp(workouts.template))],
    )..orderBy([OrderingTerm.desc(workouts.date)]);

    final workout = await query.get();

    final workoutTemplates = workout.map(
      (row) => _WorkoutTemplate(
        row.readTable(workouts),
        row.readTable(templates),
      ),
    );

    final idToTemplate = {
      for (var t in workoutTemplates)
        if (t.template != null) t.template!.id: t.template!
    };
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

    return workoutTemplates
        .map((e) {
          TemplateAggregate? template;
          if (e.template != null) {
            template = TemplateAggregate(
              template: e.template!,
              exercises: idToExercises[e.template!.id] ?? <Exercise>[],
            );
          }
          return WorkoutAggregate(
            workout: e.workout,
            template: template,
          );
        })
        .map(WorkoutConverter().toDomain)
        .toIList();
  }

  @override
  Future<Either<WorkoutFailure, Unit>> save(WorkoutEntity workout) async {
    final aggregate = WorkoutConverter().toModel(workout);
    await db.into(workouts).insertOnConflictUpdate(aggregate.workout);

    return right(unit);
  }

  @override
  Future<Either<WorkoutFailure, WorkoutEntity>> get(UniqueId id) async {
    final query = select(workouts).join(
      [leftOuterJoin(templates, templates.id.equalsExp(workouts.template))],
    )..where(workouts.id.equals(id.getOrCrash()));

    final workoutResult = await query.getSingleOrNull();
    if (workoutResult == null) {
      return left(const WorkoutFailure.unexpected());
    }

    final workoutTemplate = _WorkoutTemplate(
      workoutResult.readTable(workouts),
      workoutResult.readTable(templates),
    );

    if (workoutTemplate.template == null) {
      return right(
        WorkoutConverter().toDomain(
          WorkoutAggregate(workout: workoutTemplate.workout, template: null),
        ),
      );
    }

    final template = await (select(templates)
          ..where(
            (template) => template.id.equals(workoutTemplate.template!.id),
          ))
        .getSingle();

    final exerciseQuery = await (select(templatesExercises).join([
      innerJoin(exercises, exercises.id.equalsExp(templatesExercises.exercise)),
    ])
          ..where(
            templatesExercises.template.equals(workoutTemplate.template!.id),
          ))
        .get();

    final exs = exerciseQuery.map((row) => row.readTable(exercises)).toList();

    return right(
      WorkoutConverter().toDomain(
        WorkoutAggregate(
          workout: workoutTemplate.workout,
          template: TemplateAggregate(template: template, exercises: exs),
        ),
      ),
    );
  }
}

class _WorkoutTemplate {
  _WorkoutTemplate(this.workout, this.template);
  final Workout workout;
  final Template? template;
}
