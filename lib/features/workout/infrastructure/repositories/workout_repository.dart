import 'package:drift/drift.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/fast_hash.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/failures/workout_failure.dart';
import 'package:jumpat/features/workout/domain/repositories/i_workout_repository.dart';
import 'package:jumpat/features/workout/infrastructure/converters/workout_converter.dart';

part 'workout_repository.g.dart';

@DriftAccessor(tables: [Workouts])
class WorkoutRepository extends DatabaseAccessor<AppDatabase>
    with _$WorkoutRepositoryMixin
    implements IWorkoutRepository {
  WorkoutRepository({required this.db}) : super(db);
  final AppDatabase db;

  @override
  Future<Either<WorkoutFailure, Unit>> remove(WorkoutEntity workout) async {
    await (delete(workouts)
          ..where((tbl) => tbl.id.equals(workout.id.getOrCrash())))
        .go();

    return right(unit);
  }

  @override
  Future<IList<WorkoutEntity>> getAll() async {
    final workouts = await client.workouts.where().sortByDateDesc().findAll();
    return workouts.map(WorkoutEntityConverter().toDomain).toIList();
  }

  @override
  Future<Either<WorkoutFailure, Unit>> save(WorkoutEntity workout) async {
    final aggregate = WorkoutConverter().toModel(workout);
    await db.into(workouts).insertOnConflictUpdate(aggregate.workout);

    return right(unit);
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
