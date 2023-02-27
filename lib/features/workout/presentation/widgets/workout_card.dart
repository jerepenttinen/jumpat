import 'package:auto_route/auto_route.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/workout/application/movement/movement_providers.dart';
import 'package:jumpat/features/workout/application/workout/workout_providers.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/ui/routes/app_router.dart';

enum CardMenuItem { edit, asTemplate, delete }

class WorkoutCard extends HookConsumerWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final workout = ref.watch(currentWorkoutProvider);
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
                    await context.router
                        .push(EditWorkoutRoute(workout: workout));
                    break;
                  case CardMenuItem.delete:
                    break;
                  case CardMenuItem.asTemplate:
                    await ref
                        .read(movementCreateControllerprovider.notifier)
                        .handle(ExerciseEntity.create(name: 'testi'));
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
              data: (movements) => ListBody(
                children: movements.map(_buildMovementLine).toList(),
              ),
              orElse: () => const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  Text _buildMovementLine(MovementEntity movement) {
    final exercise = movement.exercise.name.getOrCrash();
    final weight = movement.weight.getOrCrash();
    final sets = movement.sets.map((set) => set.getOrCrash()).toIList();

    return Text(
      '$exercise ${weight}kg $sets',
    );
  }
}
