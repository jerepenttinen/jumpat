import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/repositories/i_workout_repository.dart';

class WorkoutCreateController
    extends StateNotifier<AsyncValue<Option<WorkoutEntity>>> {
  WorkoutCreateController(this._workoutRepository)
      : super(AsyncValue.data(none()));

  final IWorkoutRepository _workoutRepository;

  Future<void> handle() async {
    state = const AsyncValue.loading();

    final res = await _workoutRepository.create();
    state = res.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(some(r)),
    );
  }
}
