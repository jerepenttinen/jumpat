import 'package:flutter/material.dart';
import 'package:jumpat/data/isar_service.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/injection.dart';

class EditWorkoutPage extends StatelessWidget {
  const EditWorkoutPage({required this.workout, super.key});
  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workout.date.toIso8601String()),
      ),
      body: _buildMovementsList(context),
    );
  }

  StreamBuilder<List<Movement>> _buildMovementsList(BuildContext context) {
    return StreamBuilder<List<Movement>>(
      stream: getIt<IsarService>().watchMovements(workout),
      builder: (context, snapshot) {
        final movements = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movements.length,
          itemBuilder: (context, index) {
            final movement = movements[index];
            return Text(movement.weight.toString());
          },
        );
      },
    );
  }
}
