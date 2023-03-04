import 'package:drift/drift.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/failures/movement_failure.dart';
import 'package:jumpat/features/workout/domain/repositories/i_movement_repository.dart';
import 'package:jumpat/features/workout/domain/values/movement_weight.dart';
import 'package:jumpat/features/workout/infrastructure/aggregates/aggregates.dart';
import 'package:jumpat/features/workout/infrastructure/converters/movement_converter.dart';
import 'package:jumpat/features/workout/infrastructure/converters/movement_set_converter.dart';
part 'movement_repository.g.dart';

@DriftAccessor(
  tables: [
    Movements,
    MovementSets,
    Workouts,
    Exercises,
    Templates,
    TemplatesExercises,
  ],
)
class MovementRepository extends DatabaseAccessor<AppDatabase>
    with _$MovementRepositoryMixin
    implements IMovementRepository {
  MovementRepository({required this.db}) : super(db);
  final AppDatabase db;

  @override
  Future<Either<MovementFailure, Unit>> remove(MovementEntity movement) async {
    await (delete(movements)
          ..where((tbl) => tbl.id.equals(movement.id.getOrCrash())))
        .go();

    return right(unit);
  }

  @override
  Future<Either<MovementFailure, Unit>> save(MovementEntity movement) async {
    final aggregate = MovementConverter().toModel(movement);

    await transaction(() async {
      await db.into(movements).insertOnConflictUpdate(aggregate.movement);
      await batch((batch) {
        batch.insertAllOnConflictUpdate(
          movementSets,
          aggregate.sets,
        );
      });
    });

    return right(unit);
  }

  Future<IList<MovementEntity>> _listGetter(
    JoinedSelectStatement<HasResultSet, dynamic> query,
  ) async {
    final movementsResult = await query.get();

    final mwets = movementsResult.map(
      (movementResult) {
        return _MovementWorkoutExercise(
          movementResult.readTable(movements),
          movementResult.readTable(workouts),
          movementResult.readTable(exercises),
          movementResult.readTableOrNull(templates),
        );
      },
    );

    final templatesJj =
        mwets.map((e) => e.template).filter((t) => t != null).map((e) => e!);

    final idToTemplate = {for (var t in templatesJj) t.id: t};
    final tIds = idToTemplate.keys;

    final exerciseQuery = await (select(templatesExercises).join([
      innerJoin(exercises, exercises.id.equalsExp(templatesExercises.exercise)),
    ])
          ..where(templatesExercises.template.isIn(tIds)))
        .get();

    final idToExercises = <int, List<Exercise>>{};

    for (final row in exerciseQuery) {
      final exercise = row.readTable(exercises);
      final id = row.readTable(templatesExercises).template;
      idToExercises.putIfAbsent(id, () => []).add(exercise);
    }

    final movementsJj = mwets.map((e) => e.movement);

    final idToMovement = {for (var m in movementsJj) m.id: m};
    final mIds = idToMovement.keys;

    final setsQuery = await (select(movementSets).join([
      innerJoin(movements, movements.id.equalsExp(movementSets.movement)),
    ])
          ..where(movementSets.movement.isIn(mIds)))
        .get();

    final idToSets = <int, List<MovementSet>>{};

    for (final row in setsQuery) {
      final movementSet = row.readTable(movementSets);
      final id = row.readTable(movements).id;
      idToSets.putIfAbsent(id, () => []).add(movementSet);
    }

    return mwets.map((mwet) {
      return MovementConverter().toDomain(
        MovementAggregate(
          movement: mwet.movement,
          sets: idToSets[mwet.movement.id] ?? <MovementSet>[],
          workout: WorkoutAggregate(
            workout: mwet.workout,
            template: Option.fromNullable(mwet.template)
                .map(
                  (t) => TemplateAggregate(
                    template: t,
                    exercises: idToExercises[t.id] ?? <Exercise>[],
                  ),
                )
                .toNullable(),
          ),
          exercise: mwet.exercise,
        ),
      );
    }).toIList();
  }

  @override
  Future<IList<MovementEntity>> getAll(
    WorkoutEntity workout,
  ) async {
    final query = select(movements).join(
      [
        innerJoin(exercises, exercises.id.equalsExp(movements.exercise)),
        innerJoin(workouts, workouts.id.equalsExp(movements.workout)),
        leftOuterJoin(templates, templates.id.equalsExp(workouts.template)),
      ],
    )..where(movements.workout.equals(workout.id.getOrCrash()));

    return _listGetter(query);
  }

  @override
  Future<Either<MovementFailure, MovementEntity>> get(UniqueId id) async {
    final query = select(movements).join(
      [
        innerJoin(exercises, exercises.id.equalsExp(movements.exercise)),
        innerJoin(workouts, workouts.id.equalsExp(movements.workout)),
        leftOuterJoin(templates, templates.id.equalsExp(workouts.template)),
      ],
    )..where(movements.id.equals(id.getOrCrash()));

    final movementResult = await query.getSingleOrNull();
    if (movementResult == null) {
      return left(const MovementFailure.unableToFind());
    }

    final mwet = _MovementWorkoutExercise(
      movementResult.readTable(movements),
      movementResult.readTable(workouts),
      movementResult.readTable(exercises),
      movementResult.readTableOrNull(templates),
    );

    TemplateAggregate? tagg;
    if (mwet.template != null) {
      final exercisesResult = await (select(templatesExercises).join([
        innerJoin(
          exercises,
          exercises.id.equalsExp(templatesExercises.exercise),
        ),
      ])
            ..where(templatesExercises.template.equals(mwet.template!.id)))
          .get();

      final exs =
          exercisesResult.map((row) => row.readTable(exercises)).toList();

      tagg = TemplateAggregate(template: mwet.template!, exercises: exs);
    }

    final sets = await (select(movementSets)
          ..where((tbl) => tbl.movement.equals(id.getOrCrash())))
        .get();

    return right(
      MovementConverter().toDomain(
        MovementAggregate(
          movement: mwet.movement,
          sets: sets,
          workout: WorkoutAggregate(workout: mwet.workout, template: tagg),
          exercise: mwet.exercise,
        ),
      ),
    );
  }

  @override
  Future<IList<MovementEntity>> getAllByExercise(
    ExerciseEntity exerciseEntity,
  ) async {
    final query = select(movements).join(
      [
        innerJoin(exercises, exercises.id.equalsExp(movements.exercise)),
        innerJoin(workouts, workouts.id.equalsExp(movements.workout)),
        leftOuterJoin(templates, templates.id.equalsExp(workouts.template)),
      ],
    )
      ..where(movements.exercise.equals(exerciseEntity.id.getOrCrash()))
      ..orderBy([OrderingTerm.desc(workouts.date)]);

    return _listGetter(query);
  }

  @override
  Future<Either<MovementFailure, Unit>> saveAll(
    IList<MovementEntity> amovements,
  ) async {
    await transaction(() async {
      await batch((batch) {
        batch.insertAllOnConflictUpdate(
          movements,
          amovements.map((mov) => MovementConverter().toModel(mov).movement),
        );
      });
      await batch((batch) {
        for (final mov in amovements) {
          batch.insertAllOnConflictUpdate(
            movementSets,
            mov.sets.map(MovementSetConverter(mov.id.getOrCrash()).toModel),
          );
        }
      });
    });

    return right(unit);
  }

  @override
  Future<MovementWeight> getPriorWeight(
    DateTime date,
    ExerciseEntity exercise,
  ) async {
    final query = select(movements).join([
      innerJoin(
        workouts,
        workouts.id.equalsExp(movements.workout),
      ),
      innerJoin(
        exercises,
        exercises.id.equalsExp(movements.exercise),
      ),
    ])
      ..where(
        exercises.id.equals(exercise.id.getOrCrash()) &
            workouts.date.isSmallerThanValue(date),
      )
      ..orderBy([OrderingTerm.desc(workouts.date)])
      ..limit(1);

    final result = await query.getSingleOrNull();

    if (result == null) {
      return MovementWeight(0);
    }

    return MovementWeight(result.readTable(movements).weight);
  }
}

class _MovementWorkoutExercise {
  _MovementWorkoutExercise(
    this.movement,
    this.workout,
    this.exercise,
    this.template,
  );

  final Movement movement;
  final Workout workout;
  final Template? template;
  final Exercise exercise;
}
