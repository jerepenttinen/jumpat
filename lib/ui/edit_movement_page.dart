import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:jumpat/data/isar_service.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/injection.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:jumpat/ui/widgets/select_exercise_dialog.dart';

class EditMovementPage extends StatefulWidget {
  const EditMovementPage({required this.movement, super.key});
  final Movement movement;

  @override
  State<EditMovementPage> createState() => _EditMovementPageState();
}

class _EditMovementPageState extends State<EditMovementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movement.exercise.value?.name ?? 'Tuntematon'),
        actions: [
          IconButton(
            onPressed: () async {
              final exercise = await selectExerciseDialog(context);

              if (exercise == null) {
                return;
              }

              setState(() {
                widget.movement.exercise.value = exercise;
              });

              exercise.movements.add(widget.movement);
              await getIt<IsarService>().saveMovement(widget.movement);
            },
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: _buildSetsList(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // final workout = await getIt<IsarService>().saveWorkout(
          //   Workout()..date = DateTime.now(),
          // );

          // context.router.push(EditMovementRoute(workout: workout));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView _buildSetsList(BuildContext context) {
    return ListView.builder(
      itemCount: widget.movement.sets.length,
      itemBuilder: (context, index) {
        final set = widget.movement.sets[index];
        return _buildSetsListItem(set, index);
      },
    );
  }

  Slidable _buildSetsListItem(int set, int index) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            label: 'Edit',
            backgroundColor: Colors.teal,
            icon: Icons.delete,
            onPressed: (context) {
              // getIt<IsarService>().deleteWorkout(workout);
            },
          )
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.25,
        dismissible: DismissiblePane(
          onDismissed: () {
            // getIt<IsarService>().deleteMovement(movement);
          },
        ),
        children: [
          SlidableAction(
            label: 'Delete',
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: (context) {
              // getIt<IsarService>().deleteMovement(movement);
            },
          )
        ],
      ),
      child: ListTile(
        title: Text(set.toString()),
      ),
    );
  }
}
