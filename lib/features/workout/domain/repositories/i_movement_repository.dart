import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/failures/movement_failure.dart';

abstract class IMovementRepository {
  Future<IList<MovementEntity>> getAll(
    WorkoutEntity workout,
  );
  Future<MovementEntity> get(UniqueId id);
  Future<Either<MovementFailure, MovementEntity>> create(
    WorkoutEntity workoutEntity,
    ExerciseEntity exercise,
  );
  Future<Either<MovementFailure, Unit>> update(MovementEntity movement);
  Future<Either<MovementFailure, Unit>> delete(MovementEntity movement);
}
