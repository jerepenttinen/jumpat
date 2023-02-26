import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/failures/exercise_failure.dart';
import 'package:jumpat/features/workout/domain/values/exercise_name.dart';

abstract class IExerciseRepository {
  Stream<Either<ExerciseFailure, IList<ExerciseEntity>>> watchAll();
  Stream<Either<ExerciseFailure, ExerciseEntity>> watchOne(UniqueId id);
  Stream<Either<ExerciseFailure, IList<MovementEntity>>> watchMovements(
    ExerciseEntity exercise,
  );
  Future<Either<ExerciseFailure, Unit>> create(ExerciseEntity exercise);
  Future<Either<ExerciseFailure, Unit>> update(ExerciseEntity exercise);
  Future<Either<ExerciseFailure, IList<ExerciseEntity>>> search(
    ExerciseName name,
  );
  Future<Either<ExerciseFailure, bool>> exists(ExerciseName name);
}
