import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/failures/exercise_failure.dart';

abstract class IExerciseRepository {
  Future<IList<ExerciseEntity>> getAll();
  Future<Either<ExerciseFailure, Unit>> update(ExerciseEntity exercise);
}
