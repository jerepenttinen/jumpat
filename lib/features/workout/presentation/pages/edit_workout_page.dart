import 'package:auto_route/auto_route.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/providers/movement.dart';
import 'package:jumpat/features/workout/domain/providers/workout.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:jumpat/ui/widgets/select_exercise_dialog.dart';

class EditWorkoutPage extends HookConsumerWidget {
  const EditWorkoutPage({required this.workoutId, super.key});
  final UniqueId workoutId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final workoutAsync = ref.watch(workoutStateProvider(id: workoutId));
    return Scaffold(
      appBar: AppBar(
        title: workoutAsync.maybeWhen(
          data: (workout) => Text(t.workoutDateShort(workout.date)),
          orElse: () => null,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final workout = await ref.read(
                workoutStateProvider(id: workoutId).future,
              );
              if (context.mounted) {
                final newDate = await showDatePicker(
                  context: context,
                  initialDate: workout.date,
                  firstDate: DateTime(2010),
                  lastDate: DateTime(2050),
                );

                if (newDate != null) {
                  await ref
                      .read(
                        workoutStateProvider(id: workoutId).notifier,
                      )
                      .updateDate(newDate);
                }
              }
            },
            icon: const Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: MovementsList(workoutId: workoutId),
      floatingActionButton: FloatingActionButton(
        heroTag: UniqueKey(),
        onPressed: () async {
          final exercise = await selectExerciseDialog(context);

          await exercise.match(
            () => null,
            (exercise) async {
              // await ref
              //     .read(movementCreateControllerprovider.notifier)
              //     .handle(exercise);
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MovementsList extends ConsumerWidget {
  const MovementsList({required this.workoutId, super.key});
  final UniqueId workoutId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movementsAsync = ref.watch(movementsProvider(workoutId: workoutId));

    return movementsAsync.when(
      data: (movements) => ListView.builder(
        itemCount: movements.length,
        itemBuilder: (context, index) {
          final movement = movements[index];
          return MovementsListItem(movement: movement);
        },
      ),
      error: (error, stack) => Center(child: Text('$error')),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class MovementsListItem extends ConsumerWidget {
  const MovementsListItem({required this.movement, super.key});
  final MovementEntity movement;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final weight = movement.weight.getOrCrash();
    final sets = movement.sets.map((set) => set.getOrCrash()).toList();

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
              context.router.push(EditMovementRoute(movementId: movement.id));
            },
          )
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.3,
        dismissible: DismissiblePane(
          onDismissed: () async {
            // await ref.read(deleteMovementProvider(movement).future);
          },
        ),
        children: [
          SlidableAction(
            label: t.delete,
            backgroundColor: Theme.of(context).colorScheme.error,
            icon: Icons.delete,
            onPressed: (context) async {
              // await ref.read(deleteMovementProvider(movement).future);
            },
          )
        ],
      ),
      child: ListTile(
        title: Text(movement.exercise.name.getOrCrash()),
        subtitle: Text('${weight}kg $sets'),
      ),
    );
  }
}
