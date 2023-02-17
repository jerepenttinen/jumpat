import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/injection.dart';
import 'package:jumpat/state/workouts_actor/workouts_actor_bloc.dart';
import 'package:jumpat/state/workouts_watcher/workouts_watcher_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WorkoutsPage extends HookWidget implements AutoRouteWrapper {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jumpat'),
      ),
      body: _buildWorkoutsList(context),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WorkoutsWatcherBloc>(
          create: (context) => getIt<WorkoutsWatcherBloc>()
            ..add(const WorkoutsWatcherEvent.watchWorkouts()),
          child: this,
        ),
        BlocProvider<WorkoutsActorBloc>(
          create: (context) => getIt<WorkoutsActorBloc>(),
          child: this,
        ),
      ],
      child: this,
    );
  }

  BlocBuilder<WorkoutsWatcherBloc, WorkoutsWatcherState> _buildWorkoutsList(
    BuildContext context,
  ) {
    return BlocBuilder<WorkoutsWatcherBloc, WorkoutsWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loaded: (state) {
            return ListView.builder(
              itemCount: state.workouts.length,
              itemBuilder: (context, index) {
                final workout = state.workouts[index];
                return _buildWorkoutsListItem(context, workout);
              },
            );
          },
        );
      },
    );
  }

  BlocBuilder<WorkoutsActorBloc, WorkoutsActorState> _buildWorkoutsListItem(
    BuildContext context,
    Workout workout,
  ) {
    return BlocBuilder<WorkoutsActorBloc, WorkoutsActorState>(
      builder: (context, state) {
        return state.map(
          initial: (_) {
            return Slidable(
              key: const ValueKey(0),
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                extentRatio: 0.25,
                dismissible: DismissiblePane(
                  onDismissed: () {
                    // dao.deleteTodo(itemTodo);
                  },
                ),
                children: [
                  SlidableAction(
                    label: 'Delete',
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    onPressed: (context) {
                      // dao.deleteTodo(itemTodo);
                    },
                  )
                ],
              ),
              child: CheckboxListTile(
                title: Text(workout.date.toIso8601String()),
                // subtitle: Text(itemTodo.dueDate?.toString() ?? 'No date'),
                value: false,
                onChanged: (newValue) {
                  // dao.updateTodo(itemTodo.copyWith(done: newValue ?? false));
                },
              ),
            );
          },
          deleteSuccess: (DeleteSuccess value) => Container(),
        );
      },
    );
  }
}
