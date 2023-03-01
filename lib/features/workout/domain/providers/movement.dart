import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_set_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/providers/workout.dart';
import 'package:jumpat/features/workout/domain/values/repetition_count.dart';
import 'package:jumpat/features/workout/domain/values/movement_weight.dart';
import 'package:jumpat/features/workout/infrastructure/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movement.g.dart';

@Riverpod(keepAlive: true)
class Movements extends _$Movements {
  @override
  Future<IList<MovementEntity>> build({required UniqueId workoutId}) async {
    final repository = ref.watch(movementRepositoryProvider);
    final workout = await ref.watch(workoutStateProvider(id: workoutId).future);

    return repository.getAll(workout);
  }

  Future<void> save(MovementEntity movement) async {
    final repository = ref.watch(movementRepositoryProvider);
    await repository.update(movement);

    await update((currentList) {
      return currentList.updateById([movement], (item) => item.id);
    });
  }

  Future<void> remove(MovementEntity movement) async {
    final repository = ref.watch(movementRepositoryProvider);
    await repository.delete(movement);

    await update((currentList) {
      return currentList.removeWhere((item) => item.id == movement.id);
    });
  }

  TaskOption<MovementEntity> create(
    WorkoutEntity workout,
    ExerciseEntity exercise,
  ) {
    return TaskOption(() async {
      final repository = ref.watch(movementRepositoryProvider);
      final movement =
          MovementEntity.create(workout: workout, exercise: exercise);

      final result = await repository.update(movement);

      return await result.match((l) => none(), (r) async {
        await update((currentList) => currentList.add(movement));
        return some(movement);
      });
    });
  }
}

@Riverpod(keepAlive: true)
class MovementState extends _$MovementState {
  @override
  Future<MovementEntity> build({required UniqueId id}) {
    return ref.watch(movementRepositoryProvider).get(id);
  }

  Future<void> saveSet(MovementSetEntity set) async {
    if (!state.hasValue) {
      return;
    }

    final movement = state.value!;
    final updatedMovement = movement.copyWith(
      sets: movement.sets.updateById([set], (item) => item.id),
    );
    final movements =
        ref.read(movementsProvider(workoutId: movement.workout.id).notifier);
    await movements.save(updatedMovement);
    state = AsyncValue.data(updatedMovement);
  }

  Future<void> removeSet(MovementSetEntity set) async {
    if (!state.hasValue) {
      return;
    }

    final movement = state.value!;
    final updatedMovement = movement.copyWith(
      sets: movement.sets.removeWhere((item) => item.id == set.id),
    );
    final movements =
        ref.read(movementsProvider(workoutId: movement.workout.id).notifier);
    await movements.save(updatedMovement);
    state = AsyncValue.data(updatedMovement);
  }

  Future<void> updateWeight(MovementWeight weight) async {
    if (!state.hasValue) {
      return;
    }

    final movement = state.value!;
    final updatedMovement = movement.copyWith(weight: weight);
    final movements =
        ref.read(movementsProvider(workoutId: movement.workout.id).notifier);
    await movements.save(updatedMovement);
    state = AsyncValue.data(updatedMovement);
  }

  Future<void> updateExercise(ExerciseEntity exercise) async {
    if (!state.hasValue) {
      return;
    }

    final movement = state.value!;
    final updatedMovement = movement.copyWith(exercise: exercise);
    final movements =
        ref.read(movementsProvider(workoutId: movement.workout.id).notifier);
    await movements.save(updatedMovement);
    state = AsyncValue.data(updatedMovement);
  }
}

@riverpod
class ExerciseMovements extends _$ExerciseMovements {
  @override
  Future<IList<MovementEntity>> build({required ExerciseEntity exercise}) {
    final repository = ref.watch(movementRepositoryProvider);

    return repository.getAllByExercise(exercise);
  }
}
