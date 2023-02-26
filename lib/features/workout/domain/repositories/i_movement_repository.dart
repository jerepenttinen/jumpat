import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/failures/movement_failure.dart';

abstract class IMovementRepository {
  Stream<Either<MovementFailure, IList<MovementEntity>>> watchAll();
  Future<Either<MovementFailure, IList<MovementEntity>>> getAll();
  Stream<Either<MovementFailure, MovementEntity>> watchOne(UniqueId id);
  Future<Either<MovementFailure, MovementEntity>> create(
    ExerciseEntity exercise,
  );
  Future<Either<MovementFailure, Unit>> update(MovementEntity movement);
  Future<Either<MovementFailure, Unit>> delete(MovementEntity movement);
}
