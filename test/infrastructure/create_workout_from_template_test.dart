import 'package:drift/native.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/providers.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/providers/movement.dart';
import 'package:jumpat/features/workout/domain/providers/workout.dart';
import 'package:jumpat/features/workout/domain/values/template_color.dart';
import 'package:jumpat/features/workout/domain/values/template_name.dart';
import 'package:jumpat/features/workout/infrastructure/providers.dart';
import 'package:test/test.dart';

void main() async {
  final db = AppDatabase(NativeDatabase.memory());

  test('create workout from template', () async {
    final container = ProviderContainer(
      overrides: [
        appDatabaseProvider.overrideWithValue(db),
      ],
    );

    final workouts = container.read(workoutsProvider.notifier);

    final exercise1 = ExerciseEntity.create(name: 'testi');
    final exercise2 = ExerciseEntity.create(name: 'hyppy');

    final template = TemplateEntity.create(
      name: TemplateName('Jumppa'),
      color: TemplateColor(Colors.black),
      exercises: [exercise1, exercise2].toISet(),
    );

    await container.read(templateRepositoryProvider).save(template);

    final workout = await workouts.addFromTemplate(template: template);

    expect(workout.template, equals(some(template)));

    final movements =
        await container.read(movementsProvider(workoutId: workout.id).future);

    expect(movements, hasLength(2));

    // Should preserve order
    expect(movements[0].exercise, equals(exercise1));
    expect(movements[1].exercise, equals(exercise2));
  });
}
