import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/i_entity_converter.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/values/exercise_name.dart';

class ExerciseEntityConverter
    implements IEntityConverter<ExerciseEntity, Exercise> {
  @override
  ExerciseEntity toDomain(Exercise exercise) {
    return ExerciseEntity(
      id: UniqueId.fromUniqueInt(exercise.id),
      name: ExerciseName(exercise.name),
    );
  }

  @override
  Exercise toInfra(ExerciseEntity domain) {
    return Exercise(
      id: domain.id.getOrCrash(),
      name: domain.name.getOrCrash(),
    );
  }
}
