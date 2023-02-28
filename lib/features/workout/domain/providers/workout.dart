import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/infrastructure/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout.g.dart';

@Riverpod(keepAlive: true)
class Workouts extends _$Workouts {
  @override
  Future<IList<WorkoutEntity>> build() async {
    final repository = ref.watch(workoutRepositoryProvider);

    return repository.getAll();
  }

  Future<void> save(WorkoutEntity workout) async {
    final repository = ref.watch(workoutRepositoryProvider);
    await repository.update(workout);

    await update((currentList) {
      return currentList.updateById(
        [workout],
        (item) => item.id,
      ).sortOrdered(workoutEntityComparator);
    });
  }
}

@Riverpod(keepAlive: true)
class WorkoutState extends _$WorkoutState {
  @override
  Future<WorkoutEntity> build({required UniqueId id}) async {
    final workout = await ref.watch(workoutRepositoryProvider).get(id);
    return workout.match((l) => throw UnimplementedError(), (r) => r);
  }

  Future<void> updateDate(DateTime newDate) async {
    if (!state.hasValue) {
      return;
    }

    final workout = state.value!;
    final updatedWorkout = workout.copyWith(date: newDate);
    final workouts = ref.read(workoutsProvider.notifier);
    await workouts.save(updatedWorkout);
    state = AsyncValue.data(updatedWorkout);
  }
}
