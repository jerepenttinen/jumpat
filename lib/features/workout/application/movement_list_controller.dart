import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/repositories/i_movement_repository.dart';

class MovementListController
    extends StateNotifier<AsyncValue<IList<MovementEntity>>> {
  MovementListController(this._movementRepository)
      : super(const AsyncValue.loading()) {
    getMovements();
  }

  final IMovementRepository _movementRepository;

  Future<void> getMovements() async {
    final movements = await _movementRepository.getAll();
    state = movements.fold(
      (l) => AsyncValue.error(l.toString(), StackTrace.current),
      AsyncValue.data,
    );
  }

  void addMovement(MovementEntity movement) {
    final items = state.value ?? IList();

    state = const AsyncValue.loading();

    state = AsyncValue.data(items.add(movement));
  }

  void updateMovement(MovementEntity movement) {
    final items = state.value ?? IList();

    state = const AsyncValue.loading();

    state = AsyncValue.data(
      items.updateById(
        [movement],
        (w) => w.id == movement.id,
      ),
    );
  }

  void deleteMovement(MovementEntity movement) {
    final items = state.value!;

    state = const AsyncValue.loading();

    state = AsyncValue.data(items.remove(movement));
  }
}
