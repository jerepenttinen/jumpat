import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:jumpat/ui/widgets/choose_rep_count_dialog.dart';
import 'package:jumpat/ui/widgets/select_exercise_dialog.dart';
import 'package:jumpat/ui/widgets/weight_input.dart';

class EditMovementPage extends HookConsumerWidget {
  const EditMovementPage({required this.movement, super.key});
  final Movement movement;

  @override
  Widget build(BuildContext context, ref) {
    final movementState = useState<Movement>(movement);
    return Scaffold(
      appBar: AppBar(
        title: Text(movementState.value.exercise.value?.name ?? 'Tuntematon'),
        actions: [
          IconButton(
            onPressed: movementState.value.exercise.value != null
                ? () {
                    context.router.push(
                      ExerciseHistoryRoute(
                        exercise: movementState.value.exercise.value!,
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

              movementState.value.exercise.value = exercise;

              exercise.movements.add(movementState.value);
              await ref.read(saveMovementProvider(movementState.value).future);
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: WeightInput(
              initial: movementState.value.weight,
              onWeightChanged: (weight) async {
                await ref.read(
                  saveMovementProvider(movementState.value..weight = weight)
                      .future,
                );
              },
            ),
          ),
          SetsList(movement: movementState.value),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final count = await chooseRepCountDialog(context, 10);
          if (count == null) {
            return;
          }

          movementState.value.sets = [...movementState.value.sets, count];

          await ref.read(saveMovementProvider(movementState.value).future);
        },
        child: const Icon(Icons.add),
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
      data: (movement) {
        final sets = movement?.sets ?? [];

        return ListView.builder(
          shrinkWrap: true,
          itemCount: sets.length,
          itemBuilder: (context, index) {
            return SetsListItem(movement: movement!, sets: sets, index: index);
          },
        );
      },
      error: (err, stack) => Text('$err'),
      loading: () => const CircularProgressIndicator(),
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
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.3,
        children: [
          SlidableAction(
            label: 'Muokkaa',
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
            label: 'Poista',
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
