import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/providers/movement.dart';
import 'package:jumpat/features/workout/domain/providers/template.dart';
import 'package:jumpat/features/workout/domain/values/template_color.dart';
import 'package:jumpat/features/workout/domain/values/template_name.dart';
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

  Future<void> remove(WorkoutEntity workout) async {
    final repository = ref.watch(workoutRepositoryProvider);
    await repository.delete(workout);

    await update((currentList) {
      return currentList.removeWhere((item) => item.id == workout.id);
    });
  }

  Future<WorkoutEntity> addFromTemplate(TemplateEntity template) async {
    final workout = WorkoutEntity.template(template: template);

    final repository = ref.watch(workoutRepositoryProvider);
    await repository.update(workout);

    final movements =
        ref.watch(movementsProvider(workoutId: workout.id).notifier);

    await movements.createAll(workout, template.exercises);

    await update((currentList) {
      return currentList.updateById(
        [workout],
        (item) => item.id,
      ).sortOrdered(workoutEntityComparator);
    });

    return workout;
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

  Future<Option<TemplateEntity>> createTemplate({
    required TemplateColor color,
    required TemplateName name,
  }) async {
    if (!state.hasValue) {
      return none();
    }

    final workout = state.value!;
    final movements =
        await ref.read(movementsProvider(workoutId: workout.id).future);

    final exercises = movements.map((movement) => movement.exercise).toIList();

    final template =
        TemplateEntity.create(name: name, color: color, exercises: exercises);

    await ref.read(templatesProvider.notifier).save(template);

    final updatedWorkout = workout.copyWith(template: some(template));
    final workouts = ref.read(workoutsProvider.notifier);
    await workouts.save(updatedWorkout);
    state = AsyncValue.data(updatedWorkout);

    return some(template);
  }
}
