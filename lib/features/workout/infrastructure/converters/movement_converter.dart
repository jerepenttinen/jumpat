import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/i_converter.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/values/movement_weight.dart';
import 'package:jumpat/features/workout/infrastructure/converters/exercise_converter.dart';
import 'package:jumpat/features/workout/infrastructure/converters/movement_set_converter.dart';
import 'package:jumpat/features/workout/infrastructure/converters/workout_converter.dart';
import 'package:jumpat/features/workout/infrastructure/dtos/aggregates.dart';
import 'package:jumpat/features/workout/infrastructure/dtos/dtos.dart';

class MovementEntityConverter
    implements IConverter<MovementEntity, MovementDto> {
  @override
  MovementEntity toFirst(MovementDto dto) {
    return MovementEntity(
      id: UniqueId.fromUniqueInt(dto.id),
      weight: MovementWeight(dto.weight),
      sets: dto.sets.map(MovementSetEntityConverter().toFirst).toIList(),
      workout: WorkoutEntityConverter().toFirst(dto.workout),
      exercise: ExerciseEntityConverter().toFirst(dto.exercise),
    );
  }

  @override
  MovementDto toSecond(MovementEntity entity) {
    return MovementDto(
      id: entity.id.getOrCrash(),
      weight: entity.weight.getOrCrash(),
      sets: entity.sets.map(MovementSetEntityConverter().toSecond).toIList(),
      workout: WorkoutEntityConverter().toSecond(entity.workout),
      exercise: ExerciseEntityConverter().toSecond(entity.exercise),
    );
  }
}

class MovementDtoConverter
    implements IConverter<MovementDto, MovementAggregate> {
  @override
  MovementDto toFirst(MovementAggregate aggregate) {
    return MovementDto(
      id: aggregate.movement.id,
      weight: aggregate.movement.weight,
      sets: aggregate.sets
          .map(MovementSetDtoConverter(aggregate.movement.id).toFirst)
          .toIList(),
      workout: WorkoutDtoConverter().toFirst(aggregate.workout),
      exercise: ExerciseDtoConverter().toFirst(aggregate.exercise),
    );
  }

  @override
  MovementAggregate toSecond(MovementDto dto) {
    return MovementAggregate(
      movement: Movement(
        id: dto.id,
        weight: dto.weight,
        exercise: dto.exercise.id,
        workout: dto.workout.id,
      ),
      sets: dto.sets.map(MovementSetDtoConverter(dto.id).toSecond).toIList(),
      workout: WorkoutDtoConverter().toSecond(dto.workout),
      exercise: ExerciseDtoConverter().toSecond(dto.exercise),
    );
  }
}
