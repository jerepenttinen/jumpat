import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/data/tables.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:jumpat/ui/widgets/select_exercise_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditWorkoutPage extends ConsumerWidget {
  const EditWorkoutPage({required this.workout, super.key});
  final Workout workout;

  @override
  Widget build(BuildContext context, ref) {
    final t = AppLocalizations.of(context)!;
    final workoutAsync = ref.watch(watchWorkoutProvider(workout));
    return workoutAsync.map(
      data: (workoutData) {
        final workout = workoutData.value!;

        return Scaffold(
          appBar: AppBar(
            title: Text(t.workoutDateShort(workout.date)),
            actions: [
              IconButton(
                onPressed: () async {
                  final newDate = await showDatePicker(
                    context: context,
                    initialDate: workout.date,
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2050),
                  );

                  if (newDate != null) {
                    workout.date = newDate;
                    await ref
                        .read(saveWorkoutProvider(workout: workout).future);
                  }
                },
                icon: const Icon(Icons.calendar_today),
              ),
            ],
          ),
          body: ref.watch(watchMovementsProvider(workout)).maybeMap(
                data: (movements) => MovementsList(movements: movements.value),
                orElse: () =>
                    MovementsList(movements: workout.movements.toList()),
              ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final exercise = await selectExerciseDialog(context);

              if (exercise == null) {
                return;
              }

              final movement = await ref.read(
                createMovementProvider(workout, exercise).future,
              );

              if (context.mounted) {
                context.router.push(EditMovementRoute(movement: movement));
              }
            },
            child: const Icon(Icons.add),
          ),
        );
      },
      error: (error) => Text('$error'),
      loading: (loading) => const Center(child: CircularProgressIndicator()),
    );
  }
}

class MovementsList extends ConsumerWidget {
  const MovementsList({required this.movements, super.key});
  final List<Movement> movements;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: movements.length,
      itemBuilder: (context, index) {
        final movement = movements[index];
        return MovementsListItem(movement: movement);
      },
    );
  }
}

class MovementsListItem extends ConsumerWidget {
  const MovementsListItem({required this.movement, super.key});
  final Movement movement;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;

    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.3,
        children: [
          SlidableAction(
            label: t.edit,
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
            label: t.delete,
            backgroundColor: Theme.of(context).colorScheme.error,
            icon: Icons.delete,
            onPressed: (context) async {
              await ref.read(deleteMovementProvider(movement).future);
            },
          )
        ],
      ),
      child: ListTile(
        title: Text(movement.exercise.value?.name ?? t.unknownExercise),
        subtitle:
            Text('${movement.weight.toString()}kg ${movement.sets.toString()}'),
      ),
    );
  }
}
