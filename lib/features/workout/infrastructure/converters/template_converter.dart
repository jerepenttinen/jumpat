import 'dart:ui';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/i_converter.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/values/template_color.dart';
import 'package:jumpat/features/workout/domain/values/template_name.dart';
import 'package:jumpat/features/workout/infrastructure/converters/exercise_converter.dart';
import 'package:jumpat/features/workout/infrastructure/dtos/aggregates.dart';
import 'package:jumpat/features/workout/infrastructure/dtos/dtos.dart';

class TemplateEntityConverter
    implements IConverter<TemplateEntity, TemplateDto> {
  @override
  TemplateEntity toFirst(TemplateDto dto) {
    return TemplateEntity(
      id: UniqueId.fromUniqueInt(dto.id),
      name: TemplateName(dto.name),
      color: TemplateColor(Color(dto.color)),
      exercises: dto.exercises.map(ExerciseEntityConverter().toFirst).toIList(),
    );
  }

  @override
  TemplateDto toSecond(TemplateEntity entity) {
    return TemplateDto(
      id: entity.id.getOrCrash(),
      name: entity.name.getOrCrash(),
      color: entity.color.getOrCrash().value,
      exercises:
          entity.exercises.map(ExerciseEntityConverter().toSecond).toIList(),
    );
  }
}

class TemplateDtoConverter
    implements IConverter<TemplateDto, TemplateAggregate> {
  @override
  TemplateDto toFirst(TemplateAggregate aggregate) {
    return TemplateDto(
      id: aggregate.template.id,
      name: aggregate.template.name,
      color: aggregate.template.color,
      exercises:
          aggregate.exercises.map(ExerciseDtoConverter().toFirst).toIList(),
    );
  }

  @override
  TemplateAggregate toSecond(TemplateDto dto) {
    return TemplateAggregate(
      template: Template(id: dto.id, name: dto.name, color: dto.color),
      exercises: dto.exercises.map(ExerciseDtoConverter().toSecond).toIList(),
    );
  }
}
