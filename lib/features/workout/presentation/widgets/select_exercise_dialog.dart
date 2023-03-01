import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/providers/exercise.dart';

TaskOption<ExerciseEntity> selectExerciseDialog(
  BuildContext context,
) {
  return TaskOption(() async {
    final t = AppLocalizations.of(context)!;
    return Option.fromNullable(
      await showDialog<ExerciseEntity>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(t.exercise),
          content: const SelectExercise(),
        ),
      ),
    );
  });
}

class SelectExercise extends HookConsumerWidget {
  const SelectExercise({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTerm = useState('');
    void search(String term) => searchTerm.value = term;

    final exercisesNotifier = ref.watch(exercisesProvider.notifier);

    final exercises = exercisesNotifier.search(searchTerm.value);

    final canCreate = searchTerm.value.length > 2 &&
        !exercisesNotifier.hasExact(searchTerm.value);

    final t = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          autofocus: true,
          decoration: InputDecoration(hintText: t.exerciseNameHint),
          onChanged: search,
          onSubmitted: (value) async {
            final exercise = await ref
                .read(exercisesProvider.notifier)
                .submit(searchTerm.value);

            if (context.mounted) {
              Navigator.of(context).pop(exercise);
            }
          },
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: exercises
                  .map((e) => _createExerciseListItem(context, e))
                  .toList(),
            ),
          ),
        ),
        if (canCreate)
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: ElevatedButton(
              onPressed: () async {
                final exercise = ExerciseEntity.create(name: searchTerm.value);
                await ref.read(exercisesProvider.notifier).save(exercise);

                if (context.mounted) {
                  Navigator.of(context).pop(exercise);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  t.createExerciseButton(searchTerm.value),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
      ],
    );
  }

  Widget _createExerciseListItem(
    BuildContext context,
    ExerciseEntity exercise,
  ) {
    return ListTile(
      title: Text(exercise.name.getOrCrash()),
      onTap: () {
        Navigator.of(context).pop(exercise);
      },
    );
  }
}
