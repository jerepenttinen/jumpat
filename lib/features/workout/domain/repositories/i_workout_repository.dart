import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/failures/workout_failure.dart';

abstract class IWorkoutRepository {
  Stream<Either<WorkoutFailure, IList<WorkoutEntity>>> watchAll();
  Future<Either<WorkoutFailure, IList<WorkoutEntity>>> getAll();
  Stream<Either<WorkoutFailure, WorkoutEntity>> watchOne(UniqueId id);
  Stream<Either<WorkoutFailure, TemplateEntity>> watchTemplate(
    WorkoutEntity workout,
  );
  Future<Either<WorkoutFailure, Unit>> create(WorkoutEntity workout);
  Future<Either<WorkoutFailure, Unit>> update(WorkoutEntity workout);
  Future<Either<WorkoutFailure, Unit>> delete(WorkoutEntity workout);
}
