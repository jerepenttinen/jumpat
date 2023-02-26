import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/data/tables.dart';
import 'package:jumpat/ui/widgets/watching_list.dart';

class ExerciseHistoryPage extends StatelessWidget {
  const ExerciseHistoryPage({required this.exercise, super.key});
  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.exerciseHistory(
            exercise.name.isNotEmpty ? exercise.name : t.unknownExercise,
          ),
        ),
      ),
      body: WatchingList(
        provider: watchExerciseMovementsProvider(exercise),
        itemBuilder: (movement) => MovementsListItem(movement: movement),
      ),
    );
  }
}

class MovementsListItem extends StatelessWidget {
  const MovementsListItem({required this.movement, super.key});
  final Movement movement;

  int _sum(List<int> ints) => ints.fold(0, (acc, cur) => acc + cur);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return ListTile(
      title: Text(
        '${movement.weight}kg ${movement.sets} = ${_sum(movement.sets)}',
      ),
      subtitle: movement.workout.value != null
          ? Text(t.workoutDate(movement.workout.value!.date))
          : null,
    );
  }
}
