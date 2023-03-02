import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/failures/workout_failure.dart';

abstract class IWorkoutRepository {
  Future<IList<WorkoutEntity>> getAll();
  Future<Either<WorkoutFailure, WorkoutEntity>> get(UniqueId id);
  Future<Either<WorkoutFailure, Unit>> update(WorkoutEntity workout);
  Future<Either<WorkoutFailure, Unit>> delete(WorkoutEntity workout);
}
