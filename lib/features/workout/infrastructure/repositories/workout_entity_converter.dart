import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/i_entity_converter.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/template_entity_converter.dart';

class WorkoutEntityConverter
    implements IEntityConverter<WorkoutEntity, WorkoutWithTemplate> {
  @override
  WorkoutEntity toDomain(WorkoutWithTemplate aggregate) {
    return WorkoutEntity(
      id: UniqueId.fromUniqueInt(aggregate.workout.id),
      date: aggregate.workout.date,
      template: makeDomainOptionFromNullable(
        aggregate.template,
        TemplateEntityConverter(),
      ),
    );
  }

  @override
  WorkoutWithTemplate toInfra(WorkoutEntity domain) {
    final template = domain.template.toNullable();
    Template? t;
    if (template != null) {
      t = Template(
        id: template.id.getOrCrash(),
        name: template.name.getOrCrash(),
        color: template.color.getOrCrash().value,
      );
    }
    return WorkoutWithTemplate(
      Workout(
        id: domain.id.getOrCrash(),
        date: domain.date,
        template: template?.id.getOrCrash(),
      ),
      t,
    );
  }
}
