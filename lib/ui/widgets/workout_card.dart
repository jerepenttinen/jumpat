import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jumpat/data/isar_service.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/injection.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:jumpat/ui/widgets/confirm_delete.dart';

enum CardMenuItem { edit, delete }

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({required this.workout, super.key});

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(workout.date.toIso8601String()),
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
                        getIt<IsarService>().deleteWorkout(workout);
                      }
                    });
                    break;
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: CardMenuItem.edit,
                  child: Text('Muokkaa'),
                ),
                const PopupMenuItem(
                  value: CardMenuItem.delete,
                  child: Text('Poista'),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: StreamBuilder(
              stream: getIt<IsarService>().watchMovements(workout),
              builder: (context, snapshot) {
                final movements = snapshot.data ?? [];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: movements
                      .map(
                        (e) => Text(
                          '${e.exercise.value?.name ?? 'Tuntematon'} ${e.weight.toString()} kg ${e.sets.toString()}',
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
