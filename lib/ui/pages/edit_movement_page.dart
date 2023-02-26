import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/data/settings_provider.dart';
import 'package:jumpat/data/tables.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:jumpat/ui/widgets/choose_rep_count_dialog.dart';
import 'package:jumpat/ui/widgets/select_exercise_dialog.dart';
import 'package:jumpat/ui/widgets/weight_input.dart';

class EditMovementPage extends ConsumerWidget {
  const EditMovementPage({required this.movement, super.key});
  final Movement movement;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final movementAsync = ref.watch(watchMovementProvider(movement));

    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: movementAsync.maybeMap(
        orElse: () => null,
        data: (movementData) {
          final movement = movementData.value!;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                movement.exercise.value?.name ?? t.unknownExercise,
              ),
              actions: [
                IconButton(
                  onPressed: movement.exercise.value != null
                      ? () {
                          context.router.push(
                            ExerciseHistoryRoute(
                              exercise: movement.exercise.value!,
                            ),
                          );
                        }
                      : null,
                  icon: const Icon(Icons.history),
                ),
                IconButton(
                  onPressed: () async {
                    final exercise = await selectExerciseDialog(context);

                    if (exercise == null) {
                      return;
                    }

                    movement.exercise.value = exercise;

                    exercise.movements.add(movement);
                    await ref.read(saveMovementProvider(movement).future);
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
                    initial: movement.weight,
                    onWeightChanged: (weight) async {
                      await ref.read(
                        saveMovementProvider(movement..weight = weight).future,
                      );
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

                final defaultRepCount = movement.sets.isNotEmpty
                    ? movement.sets.last
                    : ref.read(defaultRepCountProvider);

                final count =
                    await chooseRepCountDialog(context, defaultRepCount);
                if (count == null) {
                  return;
                }

                movement.sets = [...movement.sets, count];

                await ref.read(saveMovementProvider(movement).future);
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

class SetsList extends ConsumerWidget {
  const SetsList({required this.movement, super.key});
  final Movement movement;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movementAsync = ref.watch(watchMovementProvider(movement));
    return movementAsync.when(
      data: _createList,
      error: (err, stack) => Text('$err'),
      loading: () => _createList(movement),
    );
  }

  Widget _createList(Movement? movement) {
    final sets = movement?.sets ?? [];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: sets.length,
      itemBuilder: (context, index) {
        return SetsListItem(movement: movement!, sets: sets, index: index);
      },
    );
  }
}

class SetsListItem extends ConsumerWidget {
  SetsListItem({
    required this.movement,
    required this.sets,
    required this.index,
    super.key,
  });
  final Movement movement;
  final List<int> sets;
  final int index;

  late final repCount = sets[index];

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
            onPressed: (context) async {
              final count = await chooseRepCountDialog(context, repCount);
              if (count == null) {
                return;
              }
              final newSets = [...sets];
              newSets[index] = count;
              movement.sets = newSets;

              await ref.read(saveMovementProvider(movement).future);
            },
          )
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.3,
        dismissible: DismissiblePane(
          onDismissed: () async {
            movement.sets = [...sets]..removeAt(index);
            await ref.read(saveMovementProvider(movement).future);
          },
        ),
        children: [
          SlidableAction(
            label: t.delete,
            backgroundColor: Theme.of(context).colorScheme.error,
            icon: Icons.delete,
            onPressed: (context) async {
              movement.sets = [...sets]..removeAt(index);
              await ref.read(saveMovementProvider(movement).future);
            },
          )
        ],
      ),
      child: ListTile(
        title: Text(repCount.toString()),
      ),
    );
  }
}
