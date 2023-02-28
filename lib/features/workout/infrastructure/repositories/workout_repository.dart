import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/fast_hash.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/failures/workout_failure.dart';
import 'package:jumpat/features/workout/domain/repositories/i_workout_repository.dart';
import 'package:jumpat/features/workout/infrastructure/models/collections.dart';
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
  Future<IList<WorkoutEntity>> getAll() async {
    final workouts = await client.workouts.where().sortByDateDesc().findAll();
    return workouts.map(WorkoutEntityConverter().toDomain).toIList();
  }

  @override
  Future<Either<WorkoutFailure, Unit>> update(WorkoutEntity workout) async {
    await client.writeTxn(
      () => client.workouts.put(WorkoutEntityConverter().toInfra(workout)),
    );

    return const Right(unit);
  }

  @override
  Future<Either<WorkoutFailure, WorkoutEntity>> create() async {
    final workout = WorkoutEntity.empty();

    await client.writeTxn(
      () => client.workouts.put(WorkoutEntityConverter().toInfra(workout)),
    );

    return Right(workout);
  }

  @override
  Future<Either<WorkoutFailure, WorkoutEntity>> get(UniqueId id) async {
    final workout = await client.workouts.get(fastHash(id.getOrCrash()));
    if (workout != null) {
      return right(WorkoutEntityConverter().toDomain(workout));
    } else {
      return left(const WorkoutFailure.unexpected());
    }
  }
}
