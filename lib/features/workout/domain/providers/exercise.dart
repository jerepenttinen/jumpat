import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/providers/movement.dart';
import 'package:jumpat/features/workout/domain/providers/template.dart';
import 'package:jumpat/features/workout/domain/values/exercise_name.dart';
import 'package:jumpat/features/workout/infrastructure/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exercise.g.dart';

@Riverpod(keepAlive: true)
class Exercises extends _$Exercises {
  @override
  Future<IList<ExerciseEntity>> build() {
    final repository = ref.watch(exerciseRepositoryProvider);

    return repository.getAll();
  }

  IList<ExerciseEntity> search(String name) {
    if (!state.hasValue) {
      return IList<ExerciseEntity>();
    }
    final lowerName = name.toLowerCase();

    final exercises = state.value!;
    return exercises
        .filter((t) => t.name.getOrCrash().toLowerCase().contains(lowerName))
        .toIList()
        .sortOrdered(exerciseEntityComparator);
  }

  bool hasExact(String name) {
    if (!state.hasValue) {
      return false;
    }

    final exercises = state.value!;
    return exercises
        .where((element) => element.name.getOrCrash() == name)
        .isNotEmpty;
  }

  Future<void> save(ExerciseEntity exercise) async {
    final repository = ref.watch(exerciseRepositoryProvider);
    await repository.save(exercise);

    ref
      ..invalidate(movementsProvider)
      ..invalidate(templatesProvider)
      ..invalidate(templateStateProvider)
      ..invalidate(exerciseMovementsProvider)
      ..invalidate(movementStateProvider);

    await update((currentList) {
      return currentList.updateById([exercise], (item) => item.id);
    });
  }

  Future<ExerciseEntity> submit(String name) async {
    final exercises = search(name);
    ExerciseEntity exercise;
    if (exercises.isEmpty) {
      exercise = ExerciseEntity.create(name: name);
      await save(exercise);
    } else {
      exercise = exercises.first;
    }

    return exercise;
  }
}

@Riverpod(keepAlive: true)
class ExerciseState extends _$ExerciseState {
  @override
  Future<ExerciseEntity> build({required UniqueId id}) async {
    final repository = ref.watch(exerciseRepositoryProvider);

    final exercise = await repository.get(id);
    return exercise.toNullable()!;
  }

  Future<void> updateName(ExerciseName newName) async {
    if (!state.hasValue) {
      return;
    }

    final exercise = state.value!;
    final updatedExercise = exercise.copyWith(name: newName);
    final exercises = ref.read(exercisesProvider.notifier);
    await exercises.save(updatedExercise);
    state = AsyncValue.data(updatedExercise);
  }
}
