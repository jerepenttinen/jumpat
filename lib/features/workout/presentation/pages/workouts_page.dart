import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/app_router.dart';
import 'package:jumpat/features/settings/domain/providers.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/providers/selected_day.dart';
import 'package:jumpat/features/workout/domain/providers/workout.dart';
import 'package:jumpat/features/workout/presentation/widgets/choose_template_dialog.dart';
import 'package:jumpat/features/workout/presentation/widgets/workout_card.dart';
import 'package:table_calendar/table_calendar.dart';

class WorkoutsPage extends HookConsumerWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState(0);
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.name),
      ),
      body: IndexedStack(
        index: selected.value,
        children: const [CalendarWorkoutsView(), WorkoutsList()],
      ),
      floatingActionButton: const WorkoutsFab(),
      drawer: const WorkoutsDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_month),
            label: t.calendarView,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: t.listView,
          ),
        ],
        currentIndex: selected.value,
        onTap: (value) => selected.value = value,
      ),
    );
  }
}

class CalendarWorkoutsView extends HookConsumerWidget {
  const CalendarWorkoutsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutsByDateAsync = ref.watch(workoutsByDateProvider);
    final locale = ref.watch(localeStateProvider);
    final focusedDayState = useState(DateTime.now());
    final selectedDayState = ref.watch(selectedDayProvider);

    final colorScheme = Theme.of(context).colorScheme;
    return workoutsByDateAsync.when(
      data: (workoutsByDate) => SingleChildScrollView(
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TableCalendar<WorkoutEntity>(
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.primaryContainer,
                  ),
                  selectedTextStyle:
                      TextStyle(color: colorScheme.onPrimaryContainer),
                  todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.primary,
                  ),
                  todayTextStyle: TextStyle(
                    color: colorScheme.onPrimary,
                  ),
                ),
                weekendDays: const [],
                headerStyle: const HeaderStyle(formatButtonVisible: false),
                startingDayOfWeek: StartingDayOfWeek.monday,
                locale: locale.toString(),
                firstDay: DateTime.utc(2010, 0, 0),
                lastDay: DateTime.utc(2050, 0, 0),
                focusedDay: focusedDayState.value,
                selectedDayPredicate: (day) =>
                    DateUtils.isSameDay(selectedDayState, day),
                onDaySelected: (selectedDay, focusedDay) {
                  ref.read(selectedDayProvider.notifier).update(selectedDay);
                  focusedDayState.value = focusedDay;
                },
                eventLoader: (day) => workoutsByDate[day] ?? [],
                calendarBuilders: CalendarBuilders(
                  singleMarkerBuilder: (context, day, event) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: event.template
                                .map((t) => t.color.getOrCrash())
                                .toNullable() ??
                            Colors.white,
                      ),
                      width: 8,
                      height: 8,
                    );
                  },
                ),
              ),
            ),
            ...(workoutsByDate[selectedDayState] ?? <WorkoutEntity>[])
                .map((e) => WorkoutCard(workoutId: e.id)),
            const SizedBox(
              height: 120,
              width: double.infinity,
            )
          ],
        ),
      ),
      error: (error, stackTrace) => Center(child: Text('$error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class WorkoutsList extends ConsumerWidget {
  const WorkoutsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workouts = ref.watch(workoutsProvider);
    return workouts.when(
      error: (error, stackTrace) => Center(child: Text('$error')),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (workouts) => ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) => WorkoutCard(
          workoutId: workouts[index].id,
        ),
      ),
    );
  }
}

class WorkoutsDrawer extends StatelessWidget {
  const WorkoutsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return SafeArea(
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
              title: Text(t.backupTitle),
              leading: const Icon(Icons.backup),
              onTap: () {
                Navigator.pop(context);
                context.router.push(const BackupRoute());
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
    );
  }
}

class WorkoutsFab extends ConsumerWidget {
  const WorkoutsFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;

    return Wrap(
      direction: Axis.vertical,
      spacing: 16,
      children: [
        FloatingActionButton(
          heroTag: UniqueKey(),
          tooltip: t.useTemplate,
          onPressed: () async {
            final template = await chooseTemplateDialog(context);
            if (template == null) {
              return;
            }

            final workout =
                await ref.read(workoutsProvider.notifier).addFromTemplate(
                      template: template,
                      date: ref.read(selectedDayProvider),
                    );

            if (context.mounted) {
              await context.router
                  .push(EditWorkoutRoute(workoutId: workout.id));
            }
          },
          child: const Icon(Icons.control_point_duplicate_rounded),
        ),
        FloatingActionButton(
          heroTag: UniqueKey(),
          tooltip: t.newWorkout,
          child: const Icon(Icons.add),
          onPressed: () async {
            final workout =
                WorkoutEntity.withDate(date: ref.read(selectedDayProvider));
            await ref.read(workoutsProvider.notifier).save(workout);
            if (context.mounted) {
              await context.router
                  .push(EditWorkoutRoute(workoutId: workout.id));
            }
          },
        ),
      ],
    );
  }
}
