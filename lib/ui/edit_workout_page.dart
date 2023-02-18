import 'package:flutter/material.dart';
import 'package:jumpat/data/workout.dart';

class EditWorkoutPage extends StatelessWidget {
  const EditWorkoutPage({required this.workout, super.key});
  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workout.date.toIso8601String()),
      ),
    );
  }
}
