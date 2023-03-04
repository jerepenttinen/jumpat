import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/i_converter.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/values/movement_weight.dart';
import 'package:jumpat/features/workout/infrastructure/aggregates/aggregates.dart';
import 'package:jumpat/features/workout/infrastructure/converters/exercise_converter.dart';
import 'package:jumpat/features/workout/infrastructure/converters/movement_set_converter.dart';
import 'package:jumpat/features/workout/infrastructure/converters/workout_converter.dart';

class MovementConverter
    implements IConverter<MovementEntity, MovementAggregate> {
  @override
  MovementEntity toDomain(MovementAggregate aggregate) {
    return MovementEntity(
      id: UniqueId.fromUniqueInt(aggregate.movement.id),
      weight: MovementWeight(aggregate.movement.weight),
      sets: aggregate.sets
          .map(MovementSetConverter(aggregate.movement.id).toDomain)
          .toIList(),
      workout: WorkoutConverter().toDomain(aggregate.workout),
      exercise: ExerciseConverter().toDomain(aggregate.exercise),
    );
  }

  @override
  MovementAggregate toModel(MovementEntity entity) {
    return MovementAggregate(
      movement: Movement(
        id: entity.id.getOrCrash(),
        weight: entity.weight.getOrCrash(),
        exercise: entity.exercise.id.getOrCrash(),
        workout: entity.workout.id.getOrCrash(),
      ),
      sets: entity.sets
          .map(MovementSetConverter(entity.id.getOrCrash()).toModel)
          .toList(),
      workout: WorkoutConverter().toModel(entity.workout),
      exercise: ExerciseConverter().toModel(entity.exercise),
    );
  }
}
