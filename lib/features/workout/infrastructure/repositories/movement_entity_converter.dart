import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/i_entity_converter.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/values/movement_set.dart';
import 'package:jumpat/features/workout/domain/values/movement_weight.dart';
import 'package:jumpat/features/workout/infrastructure/models/collections.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/exercise_entity_converter.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/workout_entity_converter.dart';

class MovementEntityConverter
    implements IEntityConverter<MovementEntity, Movement> {
  @override
  MovementEntity toDomain(Movement movement) {
    return MovementEntity(
      id: UniqueId.fromUniqueString(movement.id),
      exercise: ExerciseEntityConverter().toDomain(movement.exercise.value!),
      sets: movement.sets.map(MovementSet.new).toIList(),
      weight: MovementWeight(movement.weight),
      workout: WorkoutEntityConverter().toDomain(movement.workout.value!),
    );
  }

  @override
  Movement toInfra(MovementEntity domain) {
    return Movement()
      ..id = domain.id.getOrCrash()
      ..weight = domain.weight.getOrCrash()
      ..sets = domain.sets.map((set) => set.getOrCrash()).toList()
      ..exercise.value = ExerciseEntityConverter().toInfra(domain.exercise)
      ..workout.value = WorkoutEntityConverter().toInfra(domain.workout);
  }
}
