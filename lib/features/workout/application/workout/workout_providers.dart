import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/core/providers.dart';
import 'package:jumpat/features/workout/application/controllers/workout/workout_create_controller.dart';
import 'package:jumpat/features/workout/application/workout/workout_list_controller.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/repositories/i_workout_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/workout_repository.dart';

final workoutRepositoryProvider = Provider<IWorkoutRepository>((ref) {
  return WorkoutRepository(client: ref.watch(isarInstanceProvider));
});

final workoutListControllerProvider = StateNotifierProvider<
    WorkoutListController, AsyncValue<IList<WorkoutEntity>>>((ref) {
  final repo = ref.watch(workoutRepositoryProvider);
  return WorkoutListController(repo);
});

final currentWorkoutProvider = Provider<WorkoutEntity>((ref) {
  throw UnimplementedError('Workout not provided');
});

final workoutCreateControllerprovider = StateNotifierProvider<
    WorkoutCreateController, AsyncValue<Option<WorkoutEntity>>>(
  (ref) {
    final repo = ref.watch(workoutRepositoryProvider);
    return WorkoutCreateController(repo);
  },
  dependencies: [workoutRepositoryProvider],
);
