import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/i_entity_converter.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_set_entity.dart';
import 'package:jumpat/features/workout/domain/values/movement_weight.dart';
import 'package:jumpat/features/workout/domain/values/repetition_count.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/exercise_entity_converter.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/workout_entity_converter.dart';

class MovementEntityConverter
    implements
        IEntityConverter<MovementEntity, MovementWithExerciseWorkoutSets> {
  @override
  MovementEntity toDomain(MovementWithExerciseWorkoutSets aggregate) {
    return MovementEntity(
      id: UniqueId.fromUniqueInt(aggregate.movement.id),
      exercise: ExerciseEntityConverter().toDomain(aggregate.exercise),
      sets: aggregate.sets
          .map(
            (set) => MovementSetEntity(
              id: UniqueId.fromUniqueInt(set.id),
              count: RepetitionCount(set.count),
            ),
          )
          .toIList(),
      weight: MovementWeight(aggregate.movement.weight),
      workout: WorkoutEntityConverter().toDomain(aggregate.workout),
    );
  }

  @override
  MovementWithExerciseWorkoutSets toInfra(MovementEntity domain) {
    return MovementWithExerciseWorkoutSets(
      Movement(
        id: domain.id.getOrCrash(),
        weight: domain.weight.getOrCrash(),
        exercise: domain.exercise.id.getOrCrash(),
        workout: domain.workout.id.getOrCrash(),
      ),
      Exercise(
        id: domain.exercise.id.getOrCrash(),
        name: domain.exercise.name.getOrCrash(),
      ),
      Workout(
        id: domain.workout.id.getOrCrash(),
        date: domain.workout.date,
        template: domain.workout.template.toNullable()?.id.getOrCrash(),
      ),
      domain.sets
          .map(
            (element) => MovementSet(
              id: element.id.getOrCrash(),
              count: element.count.getOrCrash(),
              movement: domain.id.getOrCrash(),
            ),
          )
          .toList(),
    );
  }
}
