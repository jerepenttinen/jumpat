import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jumpat/features/core/domain/entity.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/values/repetition_count.dart';

part 'movement_set_entity.freezed.dart';

@freezed
class MovementSetEntity with _$MovementSetEntity implements IEntity {
  const factory MovementSetEntity({
    required UniqueId id,
    required RepetitionCount count,
  }) = _MovementSetEntity;

  factory MovementSetEntity.create({required RepetitionCount count}) =>
      MovementSetEntity(id: UniqueId(), count: count);
}
