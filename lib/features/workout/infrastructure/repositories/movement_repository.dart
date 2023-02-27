import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/failures/movement_failure.dart';
import 'package:jumpat/features/workout/domain/repositories/i_movement_repository.dart';
import 'package:jumpat/features/workout/infrastructure/models/collections.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/exercise_entity_converter.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/movement_entity_converter.dart';

class MovementRepository implements IMovementRepository {
  MovementRepository({required this.workout, required this.client});

  final Isar client;
  final WorkoutEntity workout;

  @override
  Future<Either<MovementFailure, Unit>> delete(MovementEntity movement) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<MovementFailure, Unit>> update(MovementEntity movement) async {
    await client.writeTxn(
      () => client.movements.put(MovementEntityConverter().toInfra(movement)),
    );
    return right(unit);
  }

  @override
  Stream<Either<MovementFailure, IList<MovementEntity>>> watchAll() {
    // TODO: implement watchAll
    throw UnimplementedError();
  }

  @override
  Stream<Either<MovementFailure, MovementEntity>> watchOne(UniqueId id) {
    // TODO: implement watchOne
    throw UnimplementedError();
  }

  @override
  Future<Either<MovementFailure, IList<MovementEntity>>> getAll() async {
    final movements = await client.movements
        .filter()
        .workout(
          (q) => q.idEqualTo(workout.id.getOrCrash()),
        )
        .findAll();
    return right(movements.map(MovementEntityConverter().toDomain).toIList());
  }

  @override
  Future<Either<MovementFailure, MovementEntity>> create(
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
}
