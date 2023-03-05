import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_set_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/providers/workout.dart';
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
    await repository.save(movement);

    final exerciseMovements = ref
        .read(exerciseMovementsProvider(exercise: movement.exercise).notifier);
    await exerciseMovements.save(movement);

    await update((currentList) {
      return currentList.updateById([movement], (item) => item.id);
    });
  }

  Future<void> remove(MovementEntity movement) async {
    final repository = ref.watch(movementRepositoryProvider);
    final result = await repository.remove(movement);

    await result.match(
      (l) => null,
      (r) async => update((currentList) {
        return currentList.removeWhere((item) => item.id == movement.id);
      }),
    );
  }

  TaskOption<MovementEntity> create(
    WorkoutEntity workout,
    ExerciseEntity exercise,
  ) {
    return TaskOption(() async {
      final repository = ref.watch(movementRepositoryProvider);
      final weight = await repository.getPriorWeight(workout.date, exercise);
      final movement = MovementEntity.withWeight(
        workout: workout,
        exercise: exercise,
        weight: weight,
      );

      final result = await repository.save(movement);

      return await result.match((l) => none(), (r) async {
        await update((currentList) => currentList.add(movement));
        return some(movement);
      });
    });
  }

  Future<void> createAll(
    WorkoutEntity workout,
    IList<ExerciseEntity> exercises,
  ) async {
    final repository = ref.watch(movementRepositoryProvider);
    final movements = (await Future.wait(
      exercises.map((exercise) async {
        final weight = await repository.getPriorWeight(workout.date, exercise);
        return MovementEntity.withWeight(
          workout: workout,
          exercise: exercise,
          weight: weight,
        );
      }),
    ))
        .toIList();

    await repository.saveAll(movements);

    await update((currentList) {
      return currentList.updateById(movements, (item) => item.id);
    });
  }
}

@Riverpod(keepAlive: true)
class MovementState extends _$MovementState {
  @override
  Future<MovementEntity> build({required UniqueId id}) async {
    final movement = await ref.watch(movementRepositoryProvider).get(id);
    return movement.match(
      (l) => throw UnimplementedError(l.toString()),
      (r) => r,
    );
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

  Future<void> save(MovementEntity movement) async {
    await update((currentList) {
      return currentList.updateById([movement], (item) => item.id);
    });
  }
}
