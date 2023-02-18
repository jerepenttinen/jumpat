import 'package:flutter/material.dart';
import 'package:jumpat/data/isar_service.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/injection.dart';

class EditWorkoutPage extends StatefulWidget {
  const EditWorkoutPage({required this.workout, super.key});
  final Workout workout;

  @override
  State<EditWorkoutPage> createState() => _EditWorkoutPageState();
}

class _EditWorkoutPageState extends State<EditWorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workout.date.toIso8601String()),
        actions: [
          IconButton(
            onPressed: () async {
              final newDate = await showDatePicker(
                context: context,
                initialDate: widget.workout.date,
                firstDate: DateTime(2010),
                lastDate: DateTime(2050),
              );

              if (newDate != null) {
                setState(() {
                  widget.workout.date = newDate;
                });
                getIt<IsarService>().saveWorkout(widget.workout);
              }
            },
            icon: const Icon(Icons.calendar_today),
          )
        ],
      ),
      body: _buildMovementsList(context),
    );
  }

  StreamBuilder<List<Movement>> _buildMovementsList(BuildContext context) {
    return StreamBuilder<List<Movement>>(
      stream: getIt<IsarService>().watchMovements(widget.workout),
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
