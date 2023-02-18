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

  Future<Workout> saveWorkout(Workout workout) async {
    final isar = await db;
    // int id;
    return await isar.writeTxn(() async {
      final id = await isar.workouts.put(workout);
      return Future.value(await isar.workouts.get(id));
    });
  }

  Future<void> saveMovement(Movement movement) async {
    final isar = await db;
    await isar.writeTxn(() async => await isar.movements.put(movement));
  }

  Future<List<Movement>> getAllMovements() async {
    final isar = await db;
    return await isar.movements.where().findAll();
  }

  Stream<List<Workout>> watchWorkouts() async* {
    final isar = await db;
    yield* isar.workouts.where().watch(fireImmediately: true);
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
