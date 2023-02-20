import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jumpat/data/isar_service.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/injection.dart';

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
      body: StreamBuilder(
        stream: getIt<IsarService>().watchExerciseMovements(exercise),
        builder: (context, snapshot) {
          final movements = snapshot.data ?? [];
          return _createMovementsList(context, movements);
        },
      ),
    );
  }

  Widget _createMovementsList(BuildContext context, List<Movement> movements) {
    return ListView.builder(
      itemCount: movements.length,
      itemBuilder: (context, index) {
        final movement = movements[index];
        return ListTile(
          title: Text(
            '${movement.weight}kg ${movement.sets.toString()} = ${movement.sets.fold(0, (previousValue, element) => previousValue + element)}',
          ),
          subtitle: movement.workout.value != null
              ? Text(movement.workout.value!.date.toIso8601String())
              : null,
        );
      },
    );
  }
}
