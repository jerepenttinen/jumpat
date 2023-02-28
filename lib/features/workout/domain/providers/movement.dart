import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/infrastructure/providers.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/providers/workout.dart';
import 'package:jumpat/features/workout/domain/values/movement_set.dart';
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

  Future<void> create(WorkoutEntity workout, ExerciseEntity exercise) async {
    final repository = ref.watch(movementRepositoryProvider);
    final movement = await repository.create(workout, exercise);

    await movement.match(
      (l) => null,
      (r) async => await update((currentList) {
        return currentList.add(r);
      }),
    );
  }
}

@Riverpod(keepAlive: true)
class MovementState extends _$MovementState {
  @override
  Future<MovementEntity> build({required UniqueId id}) {
    return ref.watch(movementRepositoryProvider).get(id);
  }

  Future<void> addSet(MovementSet set) async {
    if (!state.hasValue) {
      return;
    }

    final movement = state.value!;
    final updatedMovement = movement.copyWith(sets: movement.sets.add(set));
    final movements =
        ref.read(movementsProvider(workoutId: movement.workout.id).notifier);
    await movements.save(updatedMovement);
    state = AsyncValue.data(updatedMovement);
  }
}
