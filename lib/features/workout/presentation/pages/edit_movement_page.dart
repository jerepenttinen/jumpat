import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/app_router.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/settings/domain/providers.dart';
import 'package:jumpat/features/workout/domain/entities/movement_entity.dart';
import 'package:jumpat/features/workout/domain/entities/movement_set_entity.dart';
import 'package:jumpat/features/workout/domain/providers/movement.dart';
import 'package:jumpat/features/workout/domain/values/movement_weight.dart';
import 'package:jumpat/features/workout/domain/values/repetition_count.dart';
import 'package:jumpat/features/workout/presentation/widgets/choose_rep_count_dialog.dart';
import 'package:jumpat/features/workout/presentation/widgets/select_exercise_dialog.dart';
import 'package:jumpat/features/workout/presentation/widgets/slidable_edit_delete_item.dart';
import 'package:jumpat/features/workout/presentation/widgets/weight_input.dart';

class EditMovementPage extends ConsumerWidget {
  const EditMovementPage({required this.movementId, super.key});
  final UniqueId movementId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movementAsync = ref.watch(movementStateProvider(id: movementId));
    return movementAsync.maybeWhen(
      orElse: () => const SizedBox(),
      data: (movementOpt) => movementOpt.match(
        () => const SizedBox(),
        (movement) => GestureDetector(
          onTap: () {
            final currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                movement.exercise.name.getOrCrash(),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.router.push(
                      ExerciseHistoryRoute(
                        exercise: movement.exercise,
                      ),
                    );
                  },
                  icon: const Icon(Icons.history),
                ),
                IconButton(
                  onPressed: () async {
                    await selectExerciseDialog(context)
                        .flatMap(
                          (exercise) => TaskOption.fromTask(
                            Task(
                              () => ref
                                  .read(
                                    movementStateProvider(id: movementId)
                                        .notifier,
                                  )
                                  .updateExercise(exercise),
                            ),
                          ),
                        )
                        .run();
                  },
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: WeightInput(
                    initial: movement.weight.getOrCrash(),
                    onWeightChanged: (weight) async {
                      await ref
                          .read(
                            movementStateProvider(id: movementId).notifier,
                          )
                          .updateWeight(MovementWeight(weight));
                    },
                  ),
                ),
                SetsList(movement: movement),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              heroTag: UniqueKey(),
              onPressed: () async {
                FocusScope.of(context).requestFocus(FocusNode());

                final defaultRepetitionCount = movement.sets.isNotEmpty
                    ? movement.sets.last.count.getOrCrash()
                    : ref.read(defaultRepetitionCountProvider);

                final count = await chooseRepCountDialog(
                  context,
                  defaultRepetitionCount,
                );

                await count.match(
                  () => null,
                  (count) async {
                    await ref
                        .read(
                          movementStateProvider(id: movementId).notifier,
                        )
                        .saveSet(
                          MovementSetEntity.create(
                            count: RepetitionCount(count),
                          ),
                        );
                  },
                );
              },
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}

class SetsList extends ConsumerWidget {
  const SetsList({required this.movement, super.key});
  final MovementEntity movement;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: movement.sets.length,
      itemBuilder: (context, index) {
        final set = movement.sets[index];
        return SetsListItem(movement: movement, set: set);
      },
    );
  }
}

class SetsListItem extends ConsumerWidget {
  const SetsListItem({
    required this.movement,
    required this.set,
    super.key,
  });
  final MovementEntity movement;
  final MovementSetEntity set;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SlidableEditDeleteItem(
      onDelete: () async {
        await ref
            .read(movementStateProvider(id: movement.id).notifier)
            .removeSet(set);
      },
      onEdit: (context) async {
        final count =
            await chooseRepCountDialog(context, set.count.getOrCrash());

        await count.match(
          () => null,
          (count) async => ref
              .read(
                movementStateProvider(id: movement.id).notifier,
              )
              .saveSet(
                set.copyWith(count: RepetitionCount(count)),
              ),
        );
      },
      child: ListTile(
        title: Text(set.count.getOrCrash().toString()),
      ),
    );
  }
}
