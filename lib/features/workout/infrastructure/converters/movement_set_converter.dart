import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/core/infrastructure/i_converter.dart';
import 'package:jumpat/features/workout/domain/entities/movement_set_entity.dart';
import 'package:jumpat/features/workout/domain/values/repetition_count.dart';

class MovementSetConverter
    implements IConverter<MovementSetEntity, MovementSet> {
  MovementSetConverter(this.movementId);
  final int movementId;

  @override
  MovementSetEntity toDomain(MovementSet model) {
    return MovementSetEntity(
      id: UniqueId.fromUniqueInt(model.id),
      count: RepetitionCount(model.count),
    );
  }

  @override
  MovementSet toModel(MovementSetEntity entity) {
    return MovementSet(
      id: entity.id.getOrCrash(),
      count: entity.count.getOrCrash(),
      movement: movementId,
    );
  }
}
