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
  return MovementRepository(db: ref.watch(appDatabaseProvider));
});

final workoutRepositoryProvider = Provider<IWorkoutRepository>((ref) {
  return WorkoutRepository(db: ref.watch(appDatabaseProvider));
});

final exerciseRepositoryProvider = Provider<IExerciseRepository>((ref) {
  return ExerciseRepository(db: ref.watch(appDatabaseProvider));
});

final templateRepositoryProvider = Provider<ITemplateRepository>((ref) {
  return TemplateRepository(db: ref.watch(appDatabaseProvider));
});
