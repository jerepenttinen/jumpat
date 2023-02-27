import 'package:auto_route/auto_route.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/workout/application/movement/movement_providers.dart';
import 'package:jumpat/features/workout/application/workout/workout_providers.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:jumpat/ui/widgets/select_exercise_dialog.dart';

class EditWorkoutPage extends HookConsumerWidget {
  const EditWorkoutPage({required this.workout, super.key});
  final WorkoutEntity workout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    // ref.listen(movementCreateControllerprovider, (previous, next) {
    //   next.maybeWhen(
    //     data: (data) {
    //       data.match(
    //         () {},
    //         (movement) {
    //           context.router.push(EditMovementRoute(movement: movement));
    //         },
    //       );
    //     },
    //     orElse: () {},
    //   );
    // });

    return Scaffold(
      appBar: AppBar(
        title: Text(t.workoutDateShort(workout.date)),
        actions: [
          IconButton(
            onPressed: () async {
              // final newDate = await showDatePicker(
              //   context: context,
              //   initialDate: workout.date,
              //   firstDate: DateTime(2010),
              //   lastDate: DateTime(2050),
              // );

              // if (newDate != null) {
              //   workout.date = newDate;
              //   await ref.read(saveWorkoutProvider(workout: workout).future);
              // }
            },
            icon: const Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: ProviderScope(
        overrides: [
          currentWorkoutProvider.overrideWithValue(workout),
        ],
        child: const MovementsList(),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: UniqueKey(),
        onPressed: () async {
          final exercise = await selectExerciseDialog(context);

          await exercise.match(
            () => null,
            (exercise) async {
              await ref
                  .read(movementCreateControllerprovider.notifier)
                  .handle(exercise);
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MovementsList extends ConsumerWidget {
  const MovementsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movementsAsync = ref.watch(movementListControllerProvider);

    ref.listen(movementCreateControllerprovider, (previous, next) {
      next.maybeWhen(
        data: (data) {
          data.match(
            () {},
            (movement) {
              ref
                  .read(movementListControllerProvider.notifier)
                  .addMovement(movement);
            },
          );
        },
        orElse: () {},
      );
    });

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
    final sets = movement.sets.map((set) => set.getOrCrash()).toIList();

    ref.listen(movementEditControllerProvider(movement), (previous, next) {
      next.maybeWhen(
        data: (movement) {
          print(movement);
          ref
              .read(movementListControllerProvider.notifier)
              .updateMovement(movement);
        },
        orElse: () {},
      );
    });

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
