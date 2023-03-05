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
    final exercise = ExerciseEntity.create(name: 'testi');
    await exerciseRepository.save(exercise);

    final template = TemplateEntity.create(
      name: TemplateName('Jumppa'),
      color: TemplateColor(Colors.black),
      exercises: [exercise].lock,
    );

    await templateRepository.save(template);
    await templateRepository.save(template);

    final retrievedTemplate = await templateRepository.get(template.id);
    retrievedTemplate.match(() => fail('not found'), (t) {
      expect(t, equals(template));
    });
  });
}
