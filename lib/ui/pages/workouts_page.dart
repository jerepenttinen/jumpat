import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/data/tables.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:jumpat/ui/widgets/choose_template_dialog.dart';
import 'package:jumpat/ui/widgets/watching_list.dart';
import 'package:jumpat/ui/widgets/workout_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WorkoutsPage extends ConsumerWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final t = AppLocalizations.of(context)!;
    final fabKey = GlobalKey<ExpandableFabState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.name),
      ),
      body: WatchingList(
        provider: watchWorkoutsProvider,
        itemBuilder: (workout) => WorkoutCard(workout: workout),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: fabKey,
        child: const Icon(Icons.add),
        type: ExpandableFabType.up,
        childrenOffset: const Offset(8, 8),
        distance: 60,
        overlayStyle: ExpandableFabOverlayStyle(
          color: Colors.black54,
        ),
        children: [
          FloatingActionButton.small(
            heroTag: 'useTemplate',
            tooltip: t.useTemplate,
            onPressed: () async {
              fabKey.currentState?.toggle();

              if (!(await ref.read(existsAnyTemplatesProvider.future))) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(t.noTemplatesFound)),
                  );
                }
                return;
              }

              if (context.mounted) {
                final template = await chooseTemplateDialog(context);
                if (template == null) {
                  return;
                }
                final workout = await ref.read(
                  saveWorkoutProvider(
                    workout: Workout()
                      ..date = DateTime.now()
                      ..template.value = template,
                  ).future,
                );
                for (final exercise in template.exercises) {
                  await ref
                      .read(createMovementProvider(workout, exercise).future);
                }
                if (context.mounted) {
                  context.router.push(EditWorkoutRoute(workout: workout));
                }
              }
            },
            child: const Icon(Icons.control_point_duplicate_rounded),
          ),
          FloatingActionButton.small(
            heroTag: 'newWorkout',
            tooltip: t.newWorkout,
            child: const Icon(Icons.add),
            onPressed: () async {
              fabKey.currentState?.toggle();
              final workout = await ref.read(
                saveWorkoutProvider(workout: Workout()..date = DateTime.now())
                    .future,
              );
              if (context.mounted) {
                context.router.push(EditWorkoutRoute(workout: workout));
              }
            },
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: Text(t.templates),
                leading: const Icon(Icons.list_alt),
                onTap: () {
                  Navigator.pop(context);
                  context.router.push(const TemplatesRoute());
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
              ListTile(
                title: Text(t.settingsTitle),
                leading: const Icon(Icons.settings),
                onTap: () {
                  Navigator.pop(context);
                  context.router.push(const SettingsRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
