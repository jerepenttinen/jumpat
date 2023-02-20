import 'package:isar/isar.dart';
import 'package:jumpat/data/isar_service.dart';
import 'package:jumpat/data/workout.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isarInstance(FutureProviderRef ref) async {
  const dbName = 'jumpat';
  if (Isar.instanceNames.isEmpty) {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open(
      [WorkoutSchema, MovementSchema, ExerciseSchema],
      inspector: true,
      name: dbName,
      directory: dir.path,
    );
  }

  return Future.value(Isar.getInstance(dbName));
}

@riverpod
Future<IsarService> isarService(IsarServiceRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  return IsarService(isar: isar);
}

@riverpod
Future<void> deleteWorkout(DeleteWorkoutRef ref, Workout workout) async {
  final isarService = await ref.watch(isarServiceProvider.future);
  return isarService.deleteWorkout(workout);
}

@riverpod
Future<void> deleteMovement(DeleteMovementRef ref, Movement movement) async {
  final isarService = await ref.watch(isarServiceProvider.future);
  return isarService.deleteMovement(movement);
}

@riverpod
Future<Workout> saveWorkout(
  SaveWorkoutRef ref, {
  required Workout workout,
}) async {
  final isarService = await ref.watch(isarServiceProvider.future);
  return isarService.saveWorkout(workout);
}

@riverpod
Future<Movement> saveMovement(SaveMovementRef ref, Movement movement) async {
  final isarService = await ref.watch(isarServiceProvider.future);
  return isarService.saveMovement(movement);
}

@riverpod
Future<Movement> createMovement(
  SaveMovementRef ref,
  Workout workout,
  Exercise exercise,
) async {
  final isarService = await ref.watch(isarServiceProvider.future);
  return isarService.createMovement(workout, exercise);
}

final watchWorkoutsProvider =
    StreamProvider.autoDispose<List<Workout>>((ref) async* {
  final isarService = await ref.watch(isarServiceProvider.future);
  yield* isarService.watchWorkouts();
});

final watchMovementsProvider = StreamProvider.autoDispose
    .family<List<Movement>, Workout>((ref, workout) async* {
  final isarService = await ref.watch(isarServiceProvider.future);
  yield* isarService.watchMovements(workout);
});

final watchMovementProvider = StreamProvider.autoDispose
    .family<Movement?, Movement>((ref, movement) async* {
  final isarService = await ref.watch(isarServiceProvider.future);
  yield* isarService.watchMovement(movement);
});

final watchExerciseMovementsProvider =
    StreamProvider.autoDispose.family<List<Movement>, Exercise>(
  (ref, exercise) async* {
    final isarService = await ref.watch(isarServiceProvider.future);
    yield* isarService.watchExerciseMovements(exercise);
  },
);

@riverpod
Future<List<Exercise>> searchExercises(
  SearchExercisesRef ref,
  String term,
) async {
  final isarService = await ref.watch(isarServiceProvider.future);
  return isarService.searchExercises(term);
}

@riverpod
Future<Exercise> createExercise(CreateExerciseRef ref, String name) async {
  final isarService = await ref.watch(isarServiceProvider.future);
  return isarService.createExercise(name);
}

@riverpod
Future<bool> existsExercise(ExistsExerciseRef ref, String name) async {
  final isarService = await ref.watch(isarServiceProvider.future);
  return isarService.existsExercise(name);
}
