import 'package:drift/native.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
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

void main() async {
  final db = AppDatabase(NativeDatabase.memory());

  final IWorkoutRepository workoutRepository = WorkoutRepository(db: db);
  final IMovementRepository movementRepository = MovementRepository(db: db);
  final IExerciseRepository exerciseRepository = ExerciseRepository(db: db);

  group('WorkoutRepository', () {
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
