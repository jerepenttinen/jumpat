import 'package:drift/native.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/repositories/i_exercise_repository.dart';
import 'package:jumpat/features/workout/domain/repositories/i_template_repository.dart';
import 'package:jumpat/features/workout/domain/values/template_color.dart';
import 'package:jumpat/features/workout/domain/values/template_name.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/exercise_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/template_repository.dart';
import 'package:test/test.dart';

void main() {
  final db = AppDatabase(NativeDatabase.memory());

  final IExerciseRepository exerciseRepository = ExerciseRepository(db: db);
  final ITemplateRepository templateRepository = TemplateRepository(db: db);

  test('should create template correctly', () async {
    final exercise1 = ExerciseEntity.create(name: 'testi');
    await exerciseRepository.save(exercise1);

    final exercise2 = ExerciseEntity.create(name: 'hyppy');
    await exerciseRepository.save(exercise2);

    final template = TemplateEntity.create(
      name: TemplateName('Jumppa'),
      color: TemplateColor(Colors.black),
      exercises: [exercise1, exercise2].toISet(),
    );

    await templateRepository.save(template);

    (await templateRepository.get(template.id)).match(
      () => fail('not found'),
      (t) => expect(t, equals(template)),
    );

    // Remove one exercise
    final updatedTemplate = template.copyWith(exercises: [exercise1].toISet());

    await templateRepository.save(updatedTemplate);

    (await templateRepository.get(updatedTemplate.id)).match(
      () => fail('not found'),
      (t) => expect(t, equals(updatedTemplate)),
    );
  });
}
