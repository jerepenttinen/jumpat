import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:jumpat/ui/widgets/select_exercise_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditWorkoutPage extends HookConsumerWidget {
  const EditWorkoutPage({required this.workout, super.key});
  final Workout workout;

  @override
  Widget build(BuildContext context, ref) {
    final workoutState = useState<Workout>(workout);
    return Scaffold(
      appBar: AppBar(
        title: Text(workoutState.value.date.toIso8601String()),
        actions: [
          IconButton(
            onPressed: () async {
              final newDate = await showDatePicker(
                context: context,
                initialDate: workoutState.value.date,
                firstDate: DateTime(2010),
                lastDate: DateTime(2050),
              );

              if (newDate != null) {
                workoutState.value.date = newDate;
                await ref.read(
                  saveWorkoutProvider(workout: workoutState.value).future,
                );
              }
            },
            icon: const Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: MovementsList(workout: workoutState.value),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final router = context.router;
          final exercise = await selectExerciseDialog(context);

          if (exercise == null) {
            return;
          }

          final movement = await ref.read(
            createMovementProvider(workoutState.value, exercise).future,
          );

          router.push(EditMovementRoute(movement: movement));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MovementsList extends ConsumerWidget {
  const MovementsList({required this.workout, super.key});
  final Workout workout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutsAsync = ref.watch(watchMovementsProvider(workout));
    return workoutsAsync.when(
      data: (movements) {
        return ListView.builder(
          itemCount: movements.length,
          itemBuilder: (context, index) {
            final movement = movements[index];
            return MovementsListItem(movement: movement);
          },
        );
      },
      error: (err, stack) => Text('$err'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

class MovementsListItem extends ConsumerWidget {
  const MovementsListItem({required this.movement, super.key});
  final Movement movement;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      key: UniqueKey(),
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
            await ref.read(deleteMovementProvider(movement).future);
          },
        ),
        children: [
          SlidableAction(
            label: 'Poista',
            backgroundColor: Theme.of(context).colorScheme.error,
            icon: Icons.delete,
            onPressed: (context) async {
              await ref.read(deleteMovementProvider(movement).future);
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
