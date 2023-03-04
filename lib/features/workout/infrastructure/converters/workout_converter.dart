import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/i_converter.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/infrastructure/aggregates/aggregates.dart';
import 'package:jumpat/features/workout/infrastructure/converters/template_converter.dart';

class WorkoutConverter implements IConverter<WorkoutEntity, WorkoutAggregate> {
  @override
  WorkoutEntity toDomain(WorkoutAggregate aggregate) {
    return WorkoutEntity(
      id: UniqueId.fromUniqueInt(aggregate.workout.id),
      date: aggregate.workout.date,
      template: Option.fromNullable(aggregate.template)
          .map(TemplateConverter().toDomain),
    );
  }

  @override
  WorkoutAggregate toModel(WorkoutEntity entity) {
    return WorkoutAggregate(
      workout: Workout(id: entity.id.getOrCrash(), date: entity.date),
      template: entity.template.map(TemplateConverter().toModel).toNullable(),
    );
  }
}
