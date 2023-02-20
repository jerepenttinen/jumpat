import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jumpat/data/isar_service.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/injection.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:jumpat/ui/widgets/workout_card.dart';

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({super.key});

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jumpat'),
      ),
      body: _buildWorkoutsList(context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final workout = await getIt<IsarService>().saveWorkout(
            Workout()..date = DateTime.now(),
          );
          // ignore: use_build_context_synchronously
          context.router.push(EditWorkoutRoute(workout: workout));
        },
      ),
    );
  }

  StreamBuilder<List<Workout>> _buildWorkoutsList(BuildContext context) {
    return StreamBuilder<List<Workout>>(
      stream: getIt<IsarService>().watchWorkouts(),
      builder: (context, snapshot) {
        final workouts = snapshot.data ?? [];
        return ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            final workout = workouts[index];
            return WorkoutCard(workout: workout);
          },
        );
      },
    );
  }
}
