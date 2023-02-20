import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:jumpat/ui/widgets/workout_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkoutsPage extends ConsumerWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jumpat'),
      ),
      body: const WorkoutsList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final router = context.router;
          final workout = await ref.read(
            saveWorkoutProvider(workout: Workout()..date = DateTime.now())
                .future,
          );
          router.push(EditWorkoutRoute(workout: workout));
        },
      ),
    );
  }
}

class WorkoutsList extends ConsumerWidget {
  const WorkoutsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutsAsync = ref.watch(watchWorkoutsProvider);
    return workoutsAsync.when(
      data: (workouts) {
        return ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            final workout = workouts[index];
            return WorkoutCard(workout: workout);
          },
        );
      },
      error: (err, stack) => Text('$err'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
