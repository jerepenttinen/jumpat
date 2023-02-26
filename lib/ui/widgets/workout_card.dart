import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/data/tables.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:jumpat/ui/widgets/confirm_delete.dart';
import 'package:jumpat/ui/widgets/create_template_dialog.dart';

enum CardMenuItem { edit, asTemplate, delete }

class WorkoutCard extends ConsumerWidget {
  const WorkoutCard({required this.workout, super.key});

  final Workout workout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movementsAsync = ref.watch(watchMovementsProvider(workout));
    final templateAsync = ref.watch(watchWorkoutTemplateProvider(workout));
    final t = AppLocalizations.of(context)!;
    return Card(
      elevation: 1,
      shape: templateAsync.maybeWhen(
        data: (template) => template == null
            ? null
            : RoundedRectangleBorder(
                side: BorderSide(color: Color(template.color), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
        orElse: () => null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(t.workoutDate(workout.date)),
            subtitle: templateAsync.maybeWhen(
              data: (template) => template == null ? null : Text(template.name),
              orElse: () => null,
            ),
            trailing: PopupMenuButton<CardMenuItem>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) async {
                switch (value) {
                  case CardMenuItem.edit:
                    await context.router.push(
                      EditWorkoutRoute(workout: workout),
                    );
                    break;
                  case CardMenuItem.delete:
                    final delete = await confirmDelete(context);
                    if (delete ?? false) {
                      ref.read(deleteWorkoutProvider(workout));
                    }
                    break;
                  case CardMenuItem.asTemplate:
                    await showCreateTemplateDialog(context, workout);
                    break;
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: CardMenuItem.edit,
                  child: Text(t.edit),
                ),
                PopupMenuItem(
                  value: CardMenuItem.asTemplate,
                  child: Text(t.asTemplate),
                ),
                PopupMenuItem(
                  value: CardMenuItem.delete,
                  child: Text(t.delete),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: movementsAsync.maybeWhen(
              data: (movements) {
                return ListBody(
                  children: movements
                      .map(
                        (movement) =>
                            WorkoutCardMovementLine(movement: movement),
                      )
                      .toList(),
                );
              },
              orElse: () => const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkoutCardMovementLine extends ConsumerWidget {
  const WorkoutCardMovementLine({required this.movement, super.key});
  final Movement movement;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseAsync =
        ref.watch(watchExerciseProvider(movement.exercise.value!));
    return exerciseAsync.maybeWhen(
      data: (exercise) => Text(
        '${exercise.name} ${movement.weight}kg ${movement.sets}',
      ),
      orElse: () => const SizedBox(),
    );
  }
}
