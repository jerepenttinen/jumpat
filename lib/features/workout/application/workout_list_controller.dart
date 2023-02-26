import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/repositories/i_workout_repository.dart';

class WorkoutListController
    extends StateNotifier<AsyncValue<IList<WorkoutEntity>>> {
  WorkoutListController(this._workoutRepository)
      : super(const AsyncValue.loading()) {
    getWorkouts();
  }

  final IWorkoutRepository _workoutRepository;

  Future<void> getWorkouts() async {
    final workouts = await _workoutRepository.getAll();
    state = workouts.fold(
      (l) => AsyncValue.error(l.toString(), StackTrace.current),
      AsyncValue.data,
    );
  }

  void addWorkout(WorkoutEntity workout) {
    final items = state.value ?? IList();

    state = const AsyncValue.loading();

    state = AsyncValue.data(items.add(workout));
  }

  void updateWorkout(WorkoutEntity workout) {
    final items = state.value ?? IList();

    state = const AsyncValue.loading();

    state = AsyncValue.data(
      items.updateById(
        [workout],
        (w) => w.id == workout.id,
      ),
    );
  }

  void deleteWorkout(WorkoutEntity workout) {
    final items = state.value!;

    state = const AsyncValue.loading();

    state = AsyncValue.data(items.remove(workout));
  }
}
