import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/core/providers.dart';
import 'package:jumpat/features/workout/domain/repositories/i_exercise_repository.dart';
import 'package:jumpat/features/workout/domain/repositories/i_movement_repository.dart';
import 'package:jumpat/features/workout/domain/repositories/i_template_repository.dart';
import 'package:jumpat/features/workout/domain/repositories/i_workout_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/exercise_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/movement_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/template_repository.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/workout_repository.dart';

final movementRepositoryProvider = Provider<IMovementRepository>((ref) {
  return MovementRepository(client: ref.watch(isarInstanceProvider));
});

final workoutRepositoryProvider = Provider<IWorkoutRepository>((ref) {
  return WorkoutRepository(client: ref.watch(isarInstanceProvider));
});

final exerciseRepositoryProvider = Provider<IExerciseRepository>((ref) {
  return ExerciseRepository(client: ref.watch(isarInstanceProvider));
});

final templateRepositoryProvider = Provider<ITemplateRepository>((ref) {
  return TemplateRepository(client: ref.watch(isarInstanceProvider));
});
