import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/app_router.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/providers/movement.dart';
import 'package:jumpat/features/workout/domain/providers/workout.dart';
import 'package:jumpat/features/workout/presentation/widgets/select_exercise_dialog.dart';
import 'package:jumpat/features/workout/presentation/widgets/slidable_edit_delete_item.dart';

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
          data: (workout) => Text(
            workout.match(
              () => '',
              (workout) => t.workoutDateShort(workout.date),
            ),
          ),
          orElse: () => null,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final workout = await ref.read(
                workoutStateProvider(id: workoutId).future,
              );

              if (workout.isNone()) {
                return;
              }

              final initialDate = workout.toNullable()!.date;

              if (context.mounted) {
                final newDate = await showDatePicker(
                  context: context,
                  initialDate: initialDate,
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
          final workoutOpt = await ref.read(
            workoutStateProvider(id: workoutId).future,
          );

          if (workoutOpt.isNone()) {
            return;
          }

          final workout = workoutOpt.toNullable()!;

          TaskOption<Unit> pushEditMovementRoute(MovementEntity movement) {
            return TaskOption(
              () async {
                if (context.mounted) {
                  await context.router.push(
                    EditMovementRoute(movementId: movement.id),
                  );
                }
                return some(unit);
              },
            );
          }

          if (context.mounted) {
            await selectExerciseDialog(context)
                .flatMap(
                  (exercise) => ref
                      .read(movementsProvider(workoutId: workoutId).notifier)
                      .create(workout, exercise),
                )
                .flatMap(
                  pushEditMovementRoute,
                )
                .run();
          }
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
    final weight = movement.weight.getOrCrash();
    final sets = movement.sets.map((set) => set.count.getOrCrash()).toList();

    return SlidableEditDeleteItem(
      onDelete: () async {
        await ref
            .read(
              movementsProvider(workoutId: movement.workout.id).notifier,
            )
            .remove(movement);
      },
      onEdit: (context) {
        context.router.push(EditMovementRoute(movementId: movement.id));
      },
      child: ListTile(
        title: Text(movement.exercise.name.getOrCrash()),
        subtitle: Text('${weight}kg $sets'),
      ),
    );
  }
}
