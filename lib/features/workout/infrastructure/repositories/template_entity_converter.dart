import 'dart:ui';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/i_entity_converter.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/values/template_color.dart';
import 'package:jumpat/features/workout/domain/values/template_name.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/exercise_entity_converter.dart';

class TemplateEntityConverter
    implements IEntityConverter<TemplateEntity, Template> {
  @override
  TemplateEntity toDomain(Template template) {
    return TemplateEntity(
      id: UniqueId.fromUniqueString(template.id),
      name: TemplateName(template.name),
      color: TemplateColor(Color(template.color)),
      exercises:
          template.exercises.map(ExerciseEntityConverter().toDomain).toIList(),
    );
  }

  @override
  Template toInfra(TemplateEntity domain) {
    return Template()
      ..id = domain.id.getOrCrash()
      ..name = domain.name.getOrCrash()
      ..color = domain.color.getOrCrash().value
      ..exercises.addAll(
        domain.exercises.map(ExerciseEntityConverter().toInfra),
      );
  }
}
