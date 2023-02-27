import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/repositories/i_movement_repository.dart';
import 'package:jumpat/features/workout/domain/values/movement_set.dart';

class MovementEditController extends StateNotifier<AsyncValue<MovementEntity>> {
  MovementEditController(this._movementRepository, MovementEntity movement)
      : super(AsyncValue.data(movement));

  final IMovementRepository _movementRepository;

  Future<void> addSet(MovementSet set) async {
    final movement = state.value!.copyWith(sets: state.value!.sets.add(set));

    state = const AsyncValue.loading();

    final res = await _movementRepository.update(movement);
    state = res.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(movement),
    );
  }
}
