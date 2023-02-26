import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/i_entity_converter.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/values/exercise_name.dart';
import 'package:jumpat/features/workout/infrastructure/models/collections.dart';

class ExerciseEntityConverter
    implements IEntityConverter<ExerciseEntity, Exercise> {
  @override
  ExerciseEntity toDomain(Exercise exercise) {
    return ExerciseEntity(
      id: UniqueId.fromUniqueString(exercise.id),
      name: ExerciseName(exercise.name),
    );
  }

  @override
  Exercise toInfra(ExerciseEntity domain) {
    // TODO: implement toInfra
    throw UnimplementedError();
  }
}
