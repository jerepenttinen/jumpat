import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/core/providers.dart';
import 'package:jumpat/features/workout/application/movement_list_controller.dart';
import 'package:jumpat/features/workout/application/workout_list_controller.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/repositories/i_movement_repository.dart';
import 'package:jumpat/features/workout/domain/repositories/i_workout_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/movement_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/workout_repository.dart';

final workoutRepositoryProvider = Provider<IWorkoutRepository>((ref) {
  return WorkoutRepository(client: ref.watch(isarInstanceProvider));
});

final workoutListControllerProvider = StateNotifierProvider<
    WorkoutListController, AsyncValue<IList<WorkoutEntity>>>((ref) {
  final repo = ref.watch(workoutRepositoryProvider);
  return WorkoutListController(repo);
});

final currentWorkoutProvider = Provider<Option<WorkoutEntity>>((ref) {
  return none();
});

final movementRepositoryProvider = Provider<IMovementRepository>((ref) {
  final workout = ref.watch(currentWorkoutProvider);
  return workout.match(
    () => throw UnimplementedError('Workout not provided'),
    (workout) => MovementRepository(
      client: ref.watch(isarInstanceProvider),
      workout: workout,
    ),
  );
});

final movementListControllerProvider = StateNotifierProvider<
    MovementListController, AsyncValue<IList<MovementEntity>>>((ref) {
  final repo = ref.watch(movementRepositoryProvider);
  return MovementListController(repo);
});
