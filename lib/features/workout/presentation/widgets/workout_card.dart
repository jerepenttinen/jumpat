import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/providers.dart';

enum CardMenuItem { edit, asTemplate, delete }

class WorkoutCard extends ConsumerWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final workout = ref.watch(currentWorkoutProvider).toNullable()!;
    final movements = ref.watch(movementListControllerProvider);
    return Card(
      elevation: 1,
      shape: workout.template.match(
        () => null,
        (template) => RoundedRectangleBorder(
          side: BorderSide(color: template.color.getOrCrash(), width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(t.workoutDate(workout.date)),
            subtitle: workout.template.match(
              () => null,
              (template) => Text(template.name.getOrCrash()),
            ),
            trailing: PopupMenuButton<CardMenuItem>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) async {
                switch (value) {
                  case CardMenuItem.edit:
                    break;
                  case CardMenuItem.delete:
                    break;
                  case CardMenuItem.asTemplate:
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
            child: ListBody(
              children: movements.maybeWhen(
                data: (movements) => movements.map(_buildMovementLine).toList(),
                orElse: () => [const SizedBox()],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _buildMovementLine(MovementEntity movement) {
    return Text(
      '${movement.exercise.name} ${movement.weight}kg ${movement.sets}',
    );
  }
}
