import 'package:drift/native.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/repositories/i_exercise_repository.dart';
import 'package:jumpat/features/workout/domain/repositories/i_movement_repository.dart';
import 'package:jumpat/features/workout/domain/repositories/i_template_repository.dart';
import 'package:jumpat/features/workout/domain/repositories/i_workout_repository.dart';
import 'package:jumpat/features/workout/domain/values/exercise_name.dart';
import 'package:jumpat/features/workout/domain/values/template_color.dart';
import 'package:jumpat/features/workout/domain/values/template_name.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/exercise_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/movement_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/template_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/workout_repository.dart';
import 'package:test/test.dart';

void main() {
  var db = AppDatabase(NativeDatabase.memory());

  IExerciseRepository exerciseRepository = ExerciseRepository(db: db);
  ITemplateRepository templateRepository = TemplateRepository(db: db);
  IWorkoutRepository workoutRepository = WorkoutRepository(db: db);
  IMovementRepository movementRepository = MovementRepository(db: db);

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    exerciseRepository = ExerciseRepository(db: db);
    templateRepository = TemplateRepository(db: db);
    workoutRepository = WorkoutRepository(db: db);
    movementRepository = MovementRepository(db: db);
  });

  tearDown(() async {
    await db.close();
  });

  test('should not update existing exercise when saving template', () async {
    final exercise = ExerciseEntity.create(name: 'testi');
    await exerciseRepository.save(exercise);

    final template = TemplateEntity.create(
      name: TemplateName('Jumppa'),
      color: TemplateColor(Colors.black),
      exercises: [exercise].toISet(),
    );

    await templateRepository.save(template);

    final updatedExercise = exercise.copyWith(name: ExerciseName('kissa'));
    await exerciseRepository.save(updatedExercise);

    (await exerciseRepository.get(updatedExercise.id)).match(
      (l) => fail(l.toString()),
      (r) => expect(r, equals(updatedExercise)),
    );

    // Save template that has the old name
    await templateRepository.save(template);

    // Name shouldn't have changed
    (await exerciseRepository.get(updatedExercise.id)).match(
      (l) => fail(l.toString()),
      (r) => expect(r, equals(updatedExercise)),
    );
  });

  test('should not update existing exercise when saving movement', () async {
    final exercise = ExerciseEntity.create(name: 'testi');
    await exerciseRepository.save(exercise);

    final workout = WorkoutEntity.empty();
    await workoutRepository.save(workout);

    final movement =
        MovementEntity.create(workout: workout, exercise: exercise);

    await movementRepository.save(movement);

    final updatedExercise = exercise.copyWith(name: ExerciseName('kissa'));
    await exerciseRepository.save(updatedExercise);

    (await exerciseRepository.get(updatedExercise.id)).match(
      (l) => fail(l.toString()),
      (r) => expect(r, equals(updatedExercise)),
    );

    // Save movement that has the old name
    await movementRepository.save(movement);

    // Name shouldn't have changed
    (await exerciseRepository.get(updatedExercise.id)).match(
      (l) => fail(l.toString()),
      (r) => expect(r, equals(updatedExercise)),
    );
  });
}
