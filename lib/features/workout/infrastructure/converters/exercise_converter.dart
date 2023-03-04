import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/i_converter.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/values/exercise_name.dart';
import 'package:jumpat/features/workout/infrastructure/dtos/dtos.dart';

class ExerciseEntityConverter
    implements IConverter<ExerciseEntity, ExerciseDto> {
  @override
  ExerciseEntity toFirst(ExerciseDto dto) {
    return ExerciseEntity(
      id: UniqueId.fromUniqueInt(dto.id),
      name: ExerciseName(dto.name),
    );
  }

  @override
  ExerciseDto toSecond(ExerciseEntity entity) {
    return ExerciseDto(
      id: entity.id.getOrCrash(),
      name: entity.name.getOrCrash(),
    );
  }
}

class ExerciseDtoConverter implements IConverter<ExerciseDto, Exercise> {
  @override
  ExerciseDto toFirst(Exercise model) {
    return ExerciseDto(id: model.id, name: model.name);
  }

  @override
  Exercise toSecond(ExerciseDto dto) {
    return Exercise(id: dto.id, name: dto.name);
  }
}
