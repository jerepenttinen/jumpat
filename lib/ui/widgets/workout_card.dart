import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  Widget build(BuildContext context, ref) {
    final movementsAsync = ref.watch(watchMovementsProvider(workout));
    final templateAsync = ref.watch(watchWorkoutTemplateProvider(workout));
    final t = AppLocalizations.of(context)!;
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: templateAsync.maybeWhen(
          data: (template) => template == null
              ? null
              : Color(template.color).computeLuminance() > 0.5
                  ? Typography().black
                  : Typography().white,
          orElse: () => null,
        ),
        listTileTheme: templateAsync.maybeWhen(
          data: (template) => template == null
              ? null
              : ListTileThemeData(
                  iconColor: Color(template.color).computeLuminance() > 0.5
                      ? Typography().black.bodySmall!.color
                      : Typography().white.bodyMedium!.color,
                ),
          orElse: () => null,
        ),
        popupMenuTheme: templateAsync.maybeWhen(
          data: (template) => template == null
              ? null
              : PopupMenuThemeData(color: Color(template.color)),
          orElse: () => null,
        ),
      ),
      child: Card(
        elevation: 1,
        color: templateAsync.maybeWhen(
          data: (template) => template == null ? null : Color(template.color),
          orElse: () => null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(t.workoutDate(workout.date)),
              subtitle: templateAsync.maybeWhen(
                data: (template) =>
                    template == null ? null : Text(template.name),
                orElse: () => null,
              ),
              trailing: PopupMenuButton<CardMenuItem>(
                icon: const Icon(Icons.more_vert),
                onSelected: (value) async {
                  switch (value) {
                    case CardMenuItem.edit:
                      context.router.push(EditWorkoutRoute(workout: workout));
                      break;
                    case CardMenuItem.delete:
                      confirmDelete(context).then((value) {
                        if (value) {
                          ref.read(deleteWorkoutProvider(workout));
                        }
                      });
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
        '${exercise.name} ${movement.weight.toString()}kg ${movement.sets.toString()}',
      ),
      orElse: () => const SizedBox(),
    );
  }
}
