import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/app_router.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/providers/movement.dart';
import 'package:jumpat/features/workout/domain/providers/workout.dart';
import 'package:jumpat/features/workout/presentation/widgets/confirm_delete.dart';
import 'package:jumpat/features/workout/presentation/widgets/create_template_dialog.dart';

enum CardMenuItem { edit, asTemplate, delete }

class WorkoutCard extends HookConsumerWidget {
  const WorkoutCard({required this.workoutId, super.key});
  final UniqueId workoutId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final workout = ref.watch(workoutStateProvider(id: workoutId));
    final movementsAsync = ref.watch(movementsProvider(workoutId: workoutId));

    return Card(
      elevation: 1,
      shape: workout.maybeWhen(
        orElse: () => null,
        data: (workout) => workout
            .map(
              (w) => w.template
                  .map(
                    (template) => RoundedRectangleBorder(
                      side: BorderSide(
                        color: template.color.getOrCrash(),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  )
                  .toNullable(),
            )
            .toNullable(),
      ),
      child: workout
          .maybeWhen(
            orElse: () => null,
            data: (workout) => workout.map(
              (workout) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(t.workoutDate(workout.date)),
                    subtitle: workout.template
                        .map((template) => Text(template.name.getOrCrash()))
                        .toNullable(),
                    trailing: PopupMenuButton<CardMenuItem>(
                      icon: const Icon(Icons.more_vert),
                      onSelected: (value) async {
                        switch (value) {
                          case CardMenuItem.edit:
                            await context.router
                                .push(EditWorkoutRoute(workoutId: workout.id));
                            break;
                          case CardMenuItem.delete:
                            final delete = await confirmDelete(context);
                            if (delete ?? false) {
                              await ref
                                  .read(workoutsProvider.notifier)
                                  .remove(workout);
                            }
                            break;
                          case CardMenuItem.asTemplate:
                            await showCreateTemplateDialog(context, workout)
                                .run();
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
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: movementsAsync.maybeWhen(
                      data: (movements) => ListBody(
                        children: movements.map(_buildMovementLine).toList(),
                      ),
                      orElse: () => const SizedBox(),
                    ),
                  ),
                ],
              ),
            ),
          )
          ?.toNullable(),
    );
  }

  Text _buildMovementLine(MovementEntity movement) {
    final exercise = movement.exercise.name.getOrCrash();
    final weight = movement.weight.getOrCrash();
    final sets = movement.sets.map((set) => set.count.getOrCrash()).toList();

    return Text(
      '$exercise ${weight}kg $sets',
    );
  }
}
