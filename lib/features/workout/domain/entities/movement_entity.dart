import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jumpat/features/core/domain/entity.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_set_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/values/repetition_count.dart';
import 'package:jumpat/features/workout/domain/values/movement_weight.dart';

part 'movement_entity.freezed.dart';

@freezed
class MovementEntity with _$MovementEntity implements IEntity {
  const factory MovementEntity({
    required UniqueId id,
    required MovementWeight weight,
    required IList<MovementSetEntity> sets,
    required WorkoutEntity workout,
    required ExerciseEntity exercise,
  }) = _MovementEntity;

  factory MovementEntity.empty() => MovementEntity(
        id: UniqueId(),
        weight: MovementWeight(0),
        sets: IList(),
        workout: WorkoutEntity.empty(),
        exercise: ExerciseEntity.empty(),
      );

  factory MovementEntity.create({
    required WorkoutEntity workout,
    required ExerciseEntity exercise,
  }) =>
      MovementEntity(
        id: UniqueId(),
        weight: MovementWeight(0),
        sets: IList(),
        workout: workout,
        exercise: exercise,
      );
}
