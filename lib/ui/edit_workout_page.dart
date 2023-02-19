import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:jumpat/data/isar_service.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/injection.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:jumpat/ui/widgets/select_exercise_dialog.dart';

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
          ),
        ],
      ),
      body: _buildMovementsList(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final exercise = await selectExerciseDialog(context);

          if (exercise == null) {
            return;
          }

          final movement = await getIt<IsarService>()
              .createMovement(widget.workout, exercise);

          context.router.push(EditMovementRoute(movement: movement));
        },
        child: const Icon(Icons.add),
      ),
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
            return _buildMovementsListItem(movement);
          },
        );
      },
    );
  }

  Slidable _buildMovementsListItem(Movement movement) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.3,
        children: [
          SlidableAction(
            label: 'Muokkaa',
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icons.delete,
            onPressed: (context) {
              context.router.push(EditMovementRoute(movement: movement));
            },
          )
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.3,
        dismissible: DismissiblePane(
          onDismissed: () async {
            await getIt<IsarService>().deleteMovement(movement);
          },
        ),
        children: [
          SlidableAction(
            label: 'Poista',
            backgroundColor: Theme.of(context).colorScheme.error,
            icon: Icons.delete,
            onPressed: (context) async {
              await getIt<IsarService>().deleteMovement(movement);
            },
          )
        ],
      ),
      child: ListTile(
        title: Text(movement.exercise.value?.name ?? 'Tuntematon'),
        subtitle:
            Text('${movement.weight.toString()}kg ${movement.sets.toString()}'),
      ),
    );
  }
}
