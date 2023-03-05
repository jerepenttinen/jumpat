import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/app_router.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/providers/exercise.dart';
import 'package:jumpat/features/workout/domain/values/exercise_name.dart';

class ExercisesPage extends ConsumerWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercisesAsync = ref.watch(exercisesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.exercises),
      ),
      body: exercisesAsync.when(
        data: (exercises) => ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            final exercise = exercises[index];
            return ExerciseListItem(exercise: exercise);
          },
        ),
        error: (error, stackTrace) => Center(child: Text('$error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class ExerciseListItem extends ConsumerWidget {
  const ExerciseListItem({required this.exercise, super.key});
  final ExerciseEntity exercise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(exercise.name.getOrCrash()),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () async {
          final newName = await showChangeExerciseName(context, exercise);
          if (newName == null) {
            return;
          }

          // Load exercise, so updateName has value when called
          await ref.read(exerciseStateProvider(id: exercise.id).future);

          await ref
              .read(exerciseStateProvider(id: exercise.id).notifier)
              .updateName(ExerciseName(newName));
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
  ExerciseEntity exercise,
) async {
  final t = AppLocalizations.of(context)!;
  final controller = TextEditingController(text: exercise.name.getOrCrash());
  return showDialog(
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
