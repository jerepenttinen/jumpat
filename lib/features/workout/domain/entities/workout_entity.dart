import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jumpat/features/core/domain/entity.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';

part 'workout_entity.freezed.dart';

@freezed
class WorkoutEntity with _$WorkoutEntity implements IEntity {
  const factory WorkoutEntity({
    required UniqueId id,
    required DateTime date,
    required IList<MovementEntity> movements,
    required Option<TemplateEntity> template,
  }) = _WorkoutEntity;

  factory WorkoutEntity.empty() => WorkoutEntity(
        id: UniqueId(),
        date: DateTime.now(),
        movements: IList(),
        template: const None(),
      );
}
