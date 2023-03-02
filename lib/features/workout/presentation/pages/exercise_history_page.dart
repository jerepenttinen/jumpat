import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/providers/movement.dart';

class ExerciseHistoryPage extends ConsumerWidget {
  const ExerciseHistoryPage({required this.exercise, super.key});
  final ExerciseEntity exercise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final movementsAsync =
        ref.watch(exerciseMovementsProvider(exercise: exercise));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.exerciseHistory(exercise.name.getOrCrash()),
        ),
      ),
      body: movementsAsync.when(
        data: (movements) => ListView.builder(
          itemCount: movements.length,
          itemBuilder: (context, index) {
            final movement = movements[index];
            return MovementsListItem(movement: movement);
          },
        ),
        error: (Object error, StackTrace stackTrace) =>
            Center(child: Text('$error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class MovementsListItem extends StatelessWidget {
  const MovementsListItem({required this.movement, super.key});
  final MovementEntity movement;

  int _sum(List<int> ints) => ints.fold(0, (acc, cur) => acc + cur);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final weight = movement.weight.getOrCrash();
    final sets =
        movement.sets.map((element) => element.count.getOrCrash()).toList();
    final sum = _sum(sets);
    return ListTile(
      title: Text(
        '${weight}kg $sets = $sum',
      ),
      subtitle: Text(t.workoutDate(movement.workout.date)),
    );
  }
}
