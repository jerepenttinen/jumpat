import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExercisesPage extends ConsumerWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.exercises),
      ),
      body: const ExercisesList(),
    );
  }
}

class ExercisesList extends ConsumerWidget {
  const ExercisesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercisesAsync = ref.watch(watchExercisesProvider);
    return exercisesAsync.when(
      data: (exercises) {
        return ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            final exercise = exercises[index];
            return ExerciseListItem(exercise: exercise);
          },
        );
      },
      error: (err, stack) => Text('$err'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

class ExerciseListItem extends ConsumerWidget {
  const ExerciseListItem({required this.exercise, super.key});
  final Exercise exercise;

  @override
  Widget build(BuildContext context, ref) {
    return ListTile(
      title: Text(exercise.name),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () async {
          final newName = await showChangeExerciseName(context, exercise);
          if (newName == null) {
            return;
          }
          await ref.read(saveExerciseProvider(exercise..name = newName).future);
        },
      ),
      leading: IconButton(
        icon: const Icon(Icons.history),
        onPressed: () {
          context.router.push(ExerciseHistoryRoute(exercise: exercise));
        },
      ),
    );
  }
}

Future<String?> showChangeExerciseName(
  BuildContext context,
  Exercise exercise,
) async {
  final t = AppLocalizations.of(context)!;
  final controller = TextEditingController(text: exercise.name);
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(t.changeExerciseNameTitle),
        content: TextField(
          autofocus: true,
          controller: controller,
          onSubmitted: (value) {
            Navigator.of(context).pop(controller.text);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(controller.text);
            },
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}
