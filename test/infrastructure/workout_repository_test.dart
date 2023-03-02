import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/failures/workout_failure.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/exercise_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/movement_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/workout_repository.dart';
import 'package:test/test.dart';

import 'isar.dart';

void main() async {
  await Isar.initializeIsarCore(download: true);
  final client = await openIsar();

  final workoutRepository = WorkoutRepository(client: client);
  final movementRepository = MovementRepository(client: client);
  final exerciseRepository = ExerciseRepository(client: client);

  group('WorkoutRepository', () {
    setUp(
      () => client.writeTxn(() async => client.clear()),
    );

    test('should delete movements when deleting workout', () async {
      final workout = WorkoutEntity.empty();
      await workoutRepository.update(workout);

      final exercise = ExerciseEntity.create(name: 'test');
      await exerciseRepository.update(exercise);

      final movement =
          MovementEntity.create(workout: workout, exercise: exercise);
      await movementRepository.update(movement);

      await workoutRepository.delete(workout);

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
