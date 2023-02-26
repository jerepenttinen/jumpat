import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/i_entity_converter.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/failures/workout_failure.dart';
import 'package:jumpat/features/workout/domain/repositories/i_workout_repository.dart';
import 'package:jumpat/features/workout/infrastructure/models/collections.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/template_entity_converter.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/workout_entity_converter.dart';

class WorkoutRepository implements IWorkoutRepository {
  WorkoutRepository({required this.client});

  final Isar client;

  @override
  Future<Either<WorkoutFailure, Unit>> delete(WorkoutEntity workout) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<WorkoutFailure, IList<WorkoutEntity>>> getAll() async {
    final workouts = await client.workouts.where().sortByDateDesc().findAll();
    return Right(workouts.map(WorkoutEntityConverter().toDomain).toIList());
  }

  @override
  Future<Either<WorkoutFailure, Unit>> update(WorkoutEntity workout) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<Either<WorkoutFailure, IList<WorkoutEntity>>> watchAll() {
    // TODO: implement watchAll
    throw UnimplementedError();
  }

  @override
  Stream<Either<WorkoutFailure, WorkoutEntity>> watchOne(UniqueId id) {
    // TODO: implement watchOne
    throw UnimplementedError();
  }

  @override
  Stream<Either<WorkoutFailure, TemplateEntity>> watchTemplate(
      WorkoutEntity workout) {
    // TODO: implement watchTemplate
    throw UnimplementedError();
  }

  @override
  Future<Either<WorkoutFailure, WorkoutEntity>> create() async {
    final workout = WorkoutEntity.empty();

    await client.writeTxn(
      () => client.workouts.put(WorkoutEntityConverter().toInfra(workout)),
    );

    return Right(workout);
  }
}
