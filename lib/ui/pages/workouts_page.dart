import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:jumpat/ui/widgets/workout_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WorkoutsPage extends ConsumerWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.name),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Text(t.settingsTitle),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                context.router.push(const SettingsRoute());
              },
            ),
            ListTile(
              title: Text(t.exercises),
              leading: const Icon(Icons.fitness_center),
              onTap: () {
                Navigator.pop(context);
                context.router.push(const ExercisesRoute());
              },
            ),
          ],
        ),
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