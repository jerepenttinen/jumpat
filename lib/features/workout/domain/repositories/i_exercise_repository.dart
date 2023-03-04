import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/failures/exercise_failure.dart';

abstract class IExerciseRepository {
  Future<IList<ExerciseEntity>> getAll();
  Future<Either<ExerciseFailure, ExerciseEntity>> get(UniqueId id);
  Future<Either<ExerciseFailure, Unit>> save(ExerciseEntity exercise);
}
