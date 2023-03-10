import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/failures/movement_failure.dart';
import 'package:jumpat/features/workout/domain/values/movement_weight.dart';

abstract class IMovementRepository {
  Future<IList<MovementEntity>> getAll(
    WorkoutEntity workout,
  );
  Future<IList<MovementEntity>> getAllByExercise(ExerciseEntity exercise);
  Future<Either<MovementFailure, MovementEntity>> get(UniqueId id);
  Future<Either<MovementFailure, Unit>> save(MovementEntity movement);
  Future<Either<MovementFailure, Unit>> saveAll(
    IList<MovementEntity> movements,
  );
  Future<Either<MovementFailure, Unit>> remove(MovementEntity movement);
  Future<MovementWeight> getPriorWeight(DateTime date, ExerciseEntity exercise);
}
