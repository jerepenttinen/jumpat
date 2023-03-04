import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/i_converter.dart';
import 'package:jumpat/features/workout/domain/entities/movement_set_entity.dart';
import 'package:jumpat/features/workout/domain/values/repetition_count.dart';
import 'package:jumpat/features/workout/infrastructure/dtos/dtos.dart';

class MovementSetEntityConverter
    implements IConverter<MovementSetEntity, MovementSetDto> {
  @override
  MovementSetEntity toFirst(MovementSetDto dto) {
    return MovementSetEntity(
      id: UniqueId.fromUniqueInt(dto.id),
      count: RepetitionCount(dto.count),
    );
  }

  @override
  MovementSetDto toSecond(MovementSetEntity entity) {
    return MovementSetDto(
      id: entity.id.getOrCrash(),
      count: entity.count.getOrCrash(),
    );
  }
}

class MovementSetDtoConverter
    implements IConverter<MovementSetDto, MovementSet> {
  MovementSetDtoConverter(this.movementId);

  final int movementId;

  @override
  MovementSetDto toFirst(MovementSet model) {
    return MovementSetDto(id: model.id, count: model.count);
  }

  @override
  MovementSet toSecond(MovementSetDto dto) {
    return MovementSet(id: dto.id, count: dto.count, movement: movementId);
  }
}
