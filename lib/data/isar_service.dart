import 'dart:ui';

import 'package:isar/isar.dart';
import 'package:jumpat/data/tables.dart';

class IsarService {
  final Isar isar;
  IsarService({required this.isar});

  Future<void> deleteWorkout(Workout workout) async {
    await isar.writeTxn(() async => await isar.workouts.delete(workout.id));
  }

  Future<void> deleteMovement(Movement movement) async {
    await isar.writeTxn(() async => await isar.movements.delete(movement.id));
  }

  Future<Workout> saveWorkout(Workout workout) async {
    return await isar.writeTxn(() async {
      final id = await isar.workouts.put(workout);
      return Future.value(await isar.workouts.get(id));
    });
  }

  Future<Movement> saveMovement(Movement movement) async {
    final exercise = movement.exercise.value;
    final workout = movement.workout.value;

    return await isar.writeTxn(() async {
      exercise?.movements.add(movement);
      workout?.movements.add(movement);

      final id = await isar.movements.put(movement);
      final m = (await isar.movements.get(id))!;

      await exercise?.movements.save();
      await workout?.movements.save();

      return m;
    });
  }

  Future<Movement> createMovement(Workout workout, Exercise exercise) async {
    return await isar.writeTxn(() async {
      final movement = Movement()
        ..sets = []
        ..weight = 0
        ..workout.value = workout
        ..exercise.value = exercise;

      workout.movements.add(movement);
      exercise.movements.add(movement);

      final id = await isar.movements.put(movement);
      await workout.movements.save();
      await exercise.movements.save();

      return (await isar.movements.get(id))!;
    });
  }

  Stream<List<Workout>> watchWorkouts() async* {
    yield* isar.workouts.where().sortByDateDesc().watch(fireImmediately: true);
  }

  Stream<List<Movement>> watchMovements(Workout workout) async* {
    yield* Stream.value(workout.movements.toList());
    yield* isar.movements
        .filter()
        .workout((w) => w.idEqualTo(workout.id))
        .watch(fireImmediately: true);
  }

  Stream<Movement?> watchMovement(Movement movement) async* {
    yield* Stream.value(movement);
    yield* isar.movements.watchObject(movement.id, fireImmediately: true);
  }

  Stream<List<Movement>> watchExerciseMovements(Exercise exercise) async* {
    yield* isar.workouts
        .where()
        .anyId()
        .filter()
        .movements((m) => m.exercise((e) => e.idEqualTo(exercise.id)))
        .sortByDateDesc()
        .watch(fireImmediately: true)
        .map(
          (w) => w
              .expand(
                (w) => w.movements
                    .where((m) => m.exercise.value?.id == exercise.id),
              )
              .toList(),
        );
  }

  Future<List<Exercise>> searchExercises(String term) async {
    return isar.exercises
        .filter()
        .nameContains(term, caseSensitive: false)
        .findAll();
  }

  Future<Exercise> createExercise(String name) async {
    return await isar.writeTxn(() async {
      final exercise = Exercise()..name = name;
      final id = await isar.exercises.put(exercise);

      return (await isar.exercises.get(id))!;
    });
  }

  Future<bool> existsExercise(String name) async {
    return await isar.exercises
        .filter()
        .nameEqualTo(name, caseSensitive: false)
        .isNotEmpty();
  }

  Future<Template> createTemplate(String name, Color color) async {
    return await isar.writeTxn(() async {
      final template = Template()
        ..name = name
        ..color = color.value;
      final id = await isar.templates.put(template);

      return (await isar.templates.get(id))!;
    });
  }
}
