import 'dart:ui';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jumpat/features/core/domain/entity.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/values/template_color.dart';
import 'package:jumpat/features/workout/domain/values/template_name.dart';

part 'template_entity.freezed.dart';

@freezed
class TemplateEntity with _$TemplateEntity implements IEntity {
  const factory TemplateEntity({
    required UniqueId id,
    required TemplateName name,
    required TemplateColor color,
    required IList<ExerciseEntity> exercises,
  }) = _TemplateEntity;

  factory TemplateEntity.empty() => TemplateEntity(
        id: UniqueId(),
        name: TemplateName(''),
        color: TemplateColor(const Color(0x00000000)),
        exercises: IList(),
      );
}
