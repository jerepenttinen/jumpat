import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/i_converter.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/infrastructure/converters/template_converter.dart';
import 'package:jumpat/features/workout/infrastructure/dtos/aggregates.dart';
import 'package:jumpat/features/workout/infrastructure/dtos/dtos.dart';

class WorkoutEntityConverter implements IConverter<WorkoutEntity, WorkoutDto> {
  @override
  WorkoutEntity toFirst(WorkoutDto dto) {
    var template = none<TemplateEntity>();
    if (dto.template != null) {
      template = some(TemplateEntityConverter().toFirst(dto.template!));
    }
    return WorkoutEntity(
      id: UniqueId.fromUniqueInt(dto.id),
      date: dto.date,
      template: template,
    );
  }

  @override
  WorkoutDto toSecond(WorkoutEntity entity) {
    return WorkoutDto(
      id: entity.id.getOrCrash(),
      date: entity.date,
      template:
          entity.template.map(TemplateEntityConverter().toSecond).toNullable(),
    );
  }
}

class WorkoutDtoConverter implements IConverter<WorkoutDto, WorkoutAggregate> {
  @override
  WorkoutDto toFirst(WorkoutAggregate aggregate) {
    return WorkoutDto(
      id: aggregate.workout.id,
      date: aggregate.workout.date,
      template: Option.fromNullable(aggregate.template)
          .map(TemplateDtoConverter().toFirst)
          .toNullable(),
    );
  }

  @override
  WorkoutAggregate toSecond(WorkoutDto dto) {
    TemplateAggregate? templateAggregate;
    if (dto.template != null) {
      templateAggregate = TemplateDtoConverter().toSecond(dto.template!);
    }
    return WorkoutAggregate(
      workout: Workout(id: dto.id, date: dto.date),
      template: templateAggregate,
    );
  }
}
