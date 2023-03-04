import 'package:drift/drift.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/fast_hash.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/failures/movement_failure.dart';
import 'package:jumpat/features/workout/domain/repositories/i_movement_repository.dart';
import 'package:jumpat/features/workout/domain/values/movement_weight.dart';
import 'package:jumpat/features/workout/infrastructure/converters/movement_converter.dart';
part 'movement_repository.g.dart';

@DriftAccessor(tables: [Movements, Workouts, Exercises])
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

    await db.into(movements).insertOnConflictUpdate(aggregate.movement);

    return right(unit);
  }

  @override
  Future<IList<MovementEntity>> getAll(
    WorkoutEntity workout,
  ) async {
    final movements = await client.movements
        .filter()
        .workout(
          (q) => q.idEqualTo(workout.id.getOrCrash()),
        )
        .findAll();
    return movements.map(MovementEntityConverter().toDomain).toIList();
  }

  @override
  Future<Either<MovementFailure, MovementEntity>> get(UniqueId id) async {
    final result = await client.movements.get(fastHash(id.getOrCrash()));
    return Either.fromOption(
      Option.fromNullable(result).map(MovementEntityConverter().toDomain),
      MovementFailure.unableToFind,
    );
  }

  @override
  Future<IList<MovementEntity>> getAllByExercise(
    ExerciseEntity exerciseEntity,
  ) async {
    final exercise = ExerciseEntityConverter().toInfra(exerciseEntity);
    final workouts = await client.workouts
        .filter()
        .movements((m) => m.exercise((e) => e.isarIdEqualTo(exercise.isarId)))
        .sortByDateDesc()
        .findAll();

    return workouts
        .expand(
          (w) => w.movements.where((m) => m.exercise.value?.id == exercise.id),
        )
        .map(MovementEntityConverter().toDomain)
        .toIList();
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
