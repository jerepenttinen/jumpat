import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/providers/workout.dart';
import 'package:jumpat/features/workout/domain/values/template_color.dart';
import 'package:jumpat/features/workout/domain/values/template_name.dart';
import 'package:jumpat/features/workout/infrastructure/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'template.g.dart';

@Riverpod(keepAlive: true)
class Templates extends _$Templates {
  @override
  Future<IList<TemplateEntity>> build() async {
    final repository = ref.watch(templateRepositoryProvider);

    final templates = await repository.getAll();
    return templates.sortOrdered(templateEntityComparator);
  }

  Future<void> save(TemplateEntity template) async {
    final repository = ref.watch(templateRepositoryProvider);
    await repository.save(template);

    await update((currentList) {
      return currentList.updateById(
        [template],
        (item) => item.id,
      ).sortOrdered(templateEntityComparator);
    });
  }

  Future<void> remove(TemplateEntity template) async {
    final repository = ref.watch(templateRepositoryProvider);
    await repository.remove(template);

    ref
      ..invalidate(workoutsProvider)
      ..invalidate(workoutStateProvider);

    await update((currentList) {
      return currentList.removeWhere((item) => item.id == template.id);
    });
  }
}

@Riverpod(keepAlive: true)
class TemplateState extends _$TemplateState {
  @override
  Future<TemplateEntity> build({required UniqueId id}) async {
    final repository = ref.watch(templateRepositoryProvider);
    final template = await repository.get(id);
    if (template.isNone()) {
      throw UnimplementedError();
    }
    return template.toNullable()!;
  }

  Future<void> updateName(TemplateName name) async {
    if (!state.hasValue) {
      return;
    }

    final template = state.value!;
    final updatedTemplate = template.copyWith(name: name);
    final templates = ref.read(templatesProvider.notifier);
    await templates.save(updatedTemplate);
    state = AsyncValue.data(updatedTemplate);

    ref
      ..invalidate(workoutStateProvider)
      ..invalidate(workoutsProvider);
  }

  Future<void> updateColor(TemplateColor color) async {
    if (!state.hasValue) {
      return;
    }

    final template = state.value!;
    final updatedTemplate = template.copyWith(color: color);
    final templates = ref.read(templatesProvider.notifier);
    await templates.save(updatedTemplate);
    state = AsyncValue.data(updatedTemplate);

    ref
      ..invalidate(workoutStateProvider)
      ..invalidate(workoutsProvider);
  }

  Future<void> addExercise(ExerciseEntity exercise) async {
    if (!state.hasValue) {
      return;
    }

    final template = state.value!;
    final updatedTemplate = template.copyWith(
      exercises: template.exercises.add(exercise),
    );
    final templates = ref.read(templatesProvider.notifier);
    await templates.save(updatedTemplate);
    state = AsyncValue.data(updatedTemplate);
  }

  Future<void> swapExercise({
    required ExerciseEntity oldExercise,
    required ExerciseEntity newExercise,
  }) async {
    if (!state.hasValue) {
      return;
    }

    final template = state.value!;
    final updatedTemplate = template.copyWith(
      exercises: template.exercises
          .map((ex) => ex == oldExercise ? newExercise : ex)
          .toISet(),
    );
    final templates = ref.read(templatesProvider.notifier);
    await templates.save(updatedTemplate);
    state = AsyncValue.data(updatedTemplate);
  }

  Future<void> removeExercise(ExerciseEntity exercise) async {
    if (!state.hasValue) {
      return;
    }

    final template = state.value!;
    final updatedTemplate = template.copyWith(
      exercises:
          template.exercises.removeWhere((item) => item.id == exercise.id),
    );
    final templates = ref.read(templatesProvider.notifier);
    await templates.save(updatedTemplate);
    state = AsyncValue.data(updatedTemplate);
  }
}
