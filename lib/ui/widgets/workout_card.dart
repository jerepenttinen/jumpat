import 'package:flutter/material.dart';
import 'package:jumpat/data/workout.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({required this.workout, super.key});

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(workout.date.toIso8601String()),
            trailing: const Icon(Icons.more_vert),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              children: workout.movements
                  .map(
                    (e) => Text(
                      '${e.weight.toString()} kg ${e.sets.toString()}',
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
