import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:jumpat/ui/widgets/confirm_delete.dart';

enum CardMenuItem { edit, delete }

class WorkoutCard extends ConsumerWidget {
  const WorkoutCard({required this.workout, super.key});

  final Workout workout;

  @override
  Widget build(BuildContext context, ref) {
    final movementsAsync = ref.watch(watchMovementsProvider(workout));
    final t = AppLocalizations.of(context)!;
    return Card(
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(t.workoutDate(workout.date)),
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
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: CardMenuItem.edit,
                  child: Text(t.edit),
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
            child: movementsAsync.when(
              data: (movements) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: movements
                      .map(
                        (e) => Text(
                          '${e.exercise.value?.name ?? t.unknownExercise} ${e.weight.toString()}kg ${e.sets.toString()}',
                        ),
                      )
                      .toList(),
                );
              },
              error: (err, stack) => Text('$err'),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
