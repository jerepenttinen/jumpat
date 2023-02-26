import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/i_entity_converter.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/infrastructure/models/collections.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/template_entity_converter.dart';

class WorkoutEntityConverter
    implements IEntityConverter<WorkoutEntity, Workout> {
  @override
  WorkoutEntity toDomain(Workout workout) {
    return WorkoutEntity(
      id: UniqueId.fromUniqueString(workout.id),
      date: workout.date,
      template: makeDomainOptionFromNullable(
        workout.template.value,
        TemplateEntityConverter(),
      ),
    );
  }

  @override
  Workout toInfra(WorkoutEntity domain) {
    // TODO: implement toInfra
    throw UnimplementedError();
  }
}
