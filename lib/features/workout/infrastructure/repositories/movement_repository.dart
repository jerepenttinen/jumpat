import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/fast_hash.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/failures/movement_failure.dart';
import 'package:jumpat/features/workout/domain/repositories/i_movement_repository.dart';
import 'package:jumpat/features/workout/infrastructure/models/collections.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/exercise_entity_converter.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/movement_entity_converter.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/workout_entity_converter.dart';

class MovementRepository implements IMovementRepository {
  MovementRepository({required this.client});

  final Isar client;

  @override
  Future<Either<MovementFailure, Unit>> delete(MovementEntity movement) async {
    await client.writeTxn(
      () => client.workouts.delete(fastHash(movement.id.getOrCrash())),
    );
    return right(unit);
  }

  @override
  Future<Either<MovementFailure, Unit>> update(MovementEntity movement) async {
    await client.writeTxn(
      () async {
        final m = MovementEntityConverter().toInfra(movement);
        await client.movements.put(m);
        await m.exercise.save();
        await m.workout.save();
      },
    );
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
  Future<Either<MovementFailure, MovementEntity>> create(
    WorkoutEntity workout,
    ExerciseEntity exercise,
  ) async {
    final movement =
        MovementEntity.create(workout: workout, exercise: exercise);

    await client.writeTxn(
      () async {
        final m = MovementEntityConverter().toInfra(movement);
        await client.movements.put(m);
        await client.exercises.put(ExerciseEntityConverter().toInfra(exercise));
        await m.exercise.save();
        await m.workout.save();
      },
    );

    return right(movement);
  }

  @override
  Future<MovementEntity> get(UniqueId id) async {
    final result = await client.movements.get(fastHash(id.getOrCrash()));
    return MovementEntityConverter().toDomain(result!);
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
}
