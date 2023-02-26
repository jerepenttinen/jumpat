import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/data/isar_service.dart';
import 'package:jumpat/data/tables.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

final isarServiceProvider = Provider<IsarService>(
  (ref) => throw UnimplementedError('Override this from scope'),
);

@riverpod
Future<void> deleteWorkout(DeleteWorkoutRef ref, Workout workout) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.deleteWorkout(workout);
}

@riverpod
Future<void> deleteMovement(DeleteMovementRef ref, Movement movement) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.deleteMovement(movement);
}

@riverpod
Future<Workout> saveWorkout(
  SaveWorkoutRef ref, {
  required Workout workout,
}) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.saveWorkout(workout);
}

@riverpod
Future<Movement> saveMovement(SaveMovementRef ref, Movement movement) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.saveMovement(movement);
}

@riverpod
Future<Movement> createMovement(
  SaveMovementRef ref,
  Workout workout,
  Exercise exercise,
) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.createMovement(workout: workout, exercise: exercise);
}

@riverpod
Future<Exercise> saveExercise(SaveExerciseRef ref, Exercise exercise) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.saveExercise(exercise);
}

final watchExercisesProvider =
    StreamProvider.autoDispose<List<Exercise>>((ref) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.watchExercises();
});

final watchExerciseProvider = StreamProvider.autoDispose
    .family<Exercise, Exercise>((ref, Exercise exercise) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.watchExercise(exercise);
});

final watchWorkoutsProvider = StreamProvider.autoDispose<List<Workout>>((ref) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.watchWorkouts();
});

final watchMovementsProvider =
    StreamProvider.autoDispose.family<List<Movement>, Workout>((ref, workout) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.watchMovements(workout);
});

final watchMovementProvider =
    StreamProvider.autoDispose.family<Movement?, Movement>((ref, movement) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.watchMovement(movement);
});

final watchExerciseMovementsProvider =
    StreamProvider.autoDispose.family<List<Movement>, Exercise>(
  (ref, exercise) {
    final isarService = ref.watch(isarServiceProvider);
    return isarService.watchExerciseMovements(exercise);
  },
);

final watchWorkoutTemplateProvider =
    StreamProvider.autoDispose.family<Template?, Workout>(
  (ref, workout) {
    final isarService = ref.watch(isarServiceProvider);
    return isarService.watchWorkoutTemplate(workout);
  },
);

final watchWorkoutProvider =
    StreamProvider.autoDispose.family<Workout?, Workout>((ref, workout) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.watchWorkout(workout);
});

final watchTemplatesProvider =
    StreamProvider.autoDispose<List<Template>>((ref) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.watchTemplates();
});

@riverpod
Future<List<Exercise>> searchExercises(
  SearchExercisesRef ref,
  String term,
) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.searchExercises(term);
}

@riverpod
Future<Exercise> createExercise(CreateExerciseRef ref, String name) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.createExercise(name);
}

@riverpod
Future<bool> existsExercise(ExistsExerciseRef ref, String name) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.existsExercise(name);
}

@riverpod
Future<Template> createTemplate(
  CreateTemplateRef ref,
  Workout workout,
  String name,
  Color color,
) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.createTemplate(workout: workout, name: name, color: color);
}

@riverpod
Future<bool> existsAnyTemplates(ExistsAnyTemplatesRef ref) {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.existsAnyTemplates();
}
