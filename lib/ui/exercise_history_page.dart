import 'package:flutter/material.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/data/workout.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExerciseHistoryPage extends StatelessWidget {
  const ExerciseHistoryPage({required this.exercise, super.key});
  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Historia: ${exercise.name.isNotEmpty ? exercise.name : 'Tuntematon'}',
        ),
      ),
      body: MovementsList(exercise: exercise),
    );
  }
}

class MovementsList extends ConsumerWidget {
  const MovementsList({required this.exercise, super.key});
  final Exercise exercise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movementsAsync = ref.watch(watchExerciseMovementsProvider(exercise));
    return movementsAsync.when(
      data: (movements) {
        return ListView.builder(
          itemCount: movements.length,
          itemBuilder: (context, index) {
            final movement = movements[index];
            return ListTile(
              title: Text(
                '${movement.weight}kg ${movement.sets.toString()} = ${movement.sets.fold(0, (acc, cur) => acc + cur)}',
              ),
              subtitle: movement.workout.value != null
                  ? Text(movement.workout.value!.date.toIso8601String())
                  : null,
            );
          },
        );
      },
      error: (err, stack) => Text('$err'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
