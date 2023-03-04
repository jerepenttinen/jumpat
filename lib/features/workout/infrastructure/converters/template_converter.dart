import 'dart:ui';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/i_converter.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/values/template_color.dart';
import 'package:jumpat/features/workout/domain/values/template_name.dart';
import 'package:jumpat/features/workout/infrastructure/aggregates/aggregates.dart';
import 'package:jumpat/features/workout/infrastructure/converters/exercise_converter.dart';

class TemplateConverter
    implements IConverter<TemplateEntity, TemplateAggregate> {
  @override
  TemplateEntity toDomain(TemplateAggregate aggregate) {
    return TemplateEntity(
      id: UniqueId.fromUniqueInt(aggregate.template.id),
      name: TemplateName(aggregate.template.name),
      color: TemplateColor(Color(aggregate.template.color)),
      exercises:
          aggregate.exercises.map(ExerciseConverter().toDomain).toIList(),
    );
  }

  @override
  TemplateAggregate toModel(TemplateEntity entity) {
    return TemplateAggregate(
      template: Template(
        id: entity.id.getOrCrash(),
        name: entity.name.getOrCrash(),
        color: entity.color.getOrCrash().value,
      ),
      exercises: entity.exercises.map(ExerciseConverter().toModel).toIList(),
    );
  }
}
