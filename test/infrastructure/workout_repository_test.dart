import 'package:isar/isar.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/repositories/i_exercise_repository.dart';
import 'package:jumpat/features/workout/domain/repositories/i_movement_repository.dart';
import 'package:jumpat/features/workout/domain/repositories/i_workout_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/exercise_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/movement_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/workout_repository.dart';
import 'package:test/test.dart';

import 'isar.dart';

void main() async {
  await Isar.initializeIsarCore(download: true);
  final client = await openIsar();

  final IWorkoutRepository workoutRepository =
      WorkoutRepository(client: client);
  final IMovementRepository movementRepository =
      MovementRepository(client: client);
  final IExerciseRepository exerciseRepository = ExerciseRepository(db: client);

  group('WorkoutRepository', () {
    setUp(
      () => client.writeTxn(() async => client.clear()),
    );

    test('should delete movements when deleting workout', () async {
      final workout = WorkoutEntity.empty();
      await workoutRepository.save(workout);

      final exercise = ExerciseEntity.create(name: 'test');
      await exerciseRepository.save(exercise);

      final movement =
          MovementEntity.create(workout: workout, exercise: exercise);
      await movementRepository.save(movement);

      await workoutRepository.remove(workout);

      expect(
        (await workoutRepository.get(workout.id)).toNullable(),
        equals(null),
      );
      expect(
        (await movementRepository.get(movement.id)).toNullable(),
        equals(null),
      );
    });
  });
}
