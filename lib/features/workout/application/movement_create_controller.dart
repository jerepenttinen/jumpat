import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/repositories/i_movement_repository.dart';

class MovementCreateController
    extends StateNotifier<AsyncValue<Option<MovementEntity>>> {
  MovementCreateController(this._movementRepository)
      : super(AsyncValue.data(none()));

  final IMovementRepository _movementRepository;

  Future<void> handle() async {
    state = const AsyncValue.loading();

    final res =
        await _movementRepository.create(ExerciseEntity.create(name: 'testi'));
    state = res.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(some(r)),
    );
  }
}
