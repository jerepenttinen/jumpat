import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/providers.dart';
import 'package:jumpat/features/workout/domain/repositories/i_movement_repository.dart';
import 'package:jumpat/features/workout/domain/repositories/i_workout_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/movement_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/workout_repository.dart';

final movementRepositoryProvider = Provider<IMovementRepository>(
  (ref) {
    return MovementRepository(
      client: ref.watch(isarInstanceProvider),
    );
  },
  dependencies: [isarInstanceProvider],
);

final workoutRepositoryProvider = Provider<IWorkoutRepository>((ref) {
  return WorkoutRepository(client: ref.watch(isarInstanceProvider));
});
