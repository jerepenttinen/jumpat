import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/i_converter.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/values/exercise_name.dart';

class ExerciseConverter implements IConverter<ExerciseEntity, Exercise> {
  @override
  ExerciseEntity toDomain(Exercise model) {
    return ExerciseEntity(
      id: UniqueId.fromUniqueInt(model.id),
      name: ExerciseName(model.name),
    );
  }

  @override
  Exercise toModel(ExerciseEntity entity) {
    return Exercise(
      id: entity.id.getOrCrash(),
      name: entity.name.getOrCrash(),
    );
  }
}
