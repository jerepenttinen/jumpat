import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:jumpat/data/workout.dart';
import 'package:path_provider/path_provider.dart';

@injectable
class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDb();
  }

  Future<void> deleteWorkout(Workout workout) async {
    final isar = await db;
    await isar.writeTxn(() async => await isar.workouts.delete(workout.id));
  }

  Future<void> deleteMovement(Movement movement) async {
    final isar = await db;
    await isar.writeTxn(() async => await isar.movements.delete(movement.id));
  }

  Future<Workout> saveWorkout(Workout workout) async {
    final isar = await db;
    // int id;
    return await isar.writeTxn(() async {
      final id = await isar.workouts.put(workout);
      return Future.value(await isar.workouts.get(id));
    });
  }

  Future<Movement> saveMovement(Movement movement) async {
    final isar = await db;
    return await isar.writeTxn(() async {
      final id = await isar.movements.put(movement);
      final joku = (await isar.movements.get(id))!;
      await joku.workout.save();
      return joku;
    });
  }

  Future<Movement> createMovement(Workout workout) async {
    final isar = await db;
    return await isar.writeTxn(() async {
      final movement = Movement()
        ..sets = []
        ..weight = 0
        ..workout.value = workout;
      workout.movements.add(movement);
      final id = await isar.movements.put(movement);
      await workout.movements.save();

      return (await isar.movements.get(id))!;
    });
  }

  Future<List<Movement>> getAllMovements() async {
    final isar = await db;
    return await isar.movements.where().findAll();
  }

  Stream<List<Workout>> watchWorkouts() async* {
    final isar = await db;
    yield* isar.workouts.where().sortByDateDesc().watch(fireImmediately: true);
  }

  Stream<List<Movement>> watchMovements(Workout workout) async* {
    final isar = await db;
    yield* isar.movements
        .filter()
        .workout((w) => w.idEqualTo(workout.id))
        .watch(fireImmediately: true);
  }

  Future<Isar> openDb() async {
    const dbName = 'jumpat';
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [WorkoutSchema, MovementSchema, ExerciseSchema],
        inspector: true,
        name: dbName,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance(dbName));
  }
}
