import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jumpat/features/core/domain/entity.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/values/exercise_name.dart';

part 'exercise_entity.freezed.dart';

@freezed
class ExerciseEntity with _$ExerciseEntity implements IEntity {
  const factory ExerciseEntity({
    required UniqueId id,
    required ExerciseName name,
  }) = _ExerciseEntity;

  factory ExerciseEntity.empty() => ExerciseEntity(
        id: UniqueId(),
        name: ExerciseName(''),
      );
}
