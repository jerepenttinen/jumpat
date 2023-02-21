import 'package:flutter/material.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/data/workout.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/transformers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<Exercise?> selectExerciseDialog(BuildContext context) async {
  return await showDialog<Exercise>(
    context: context,
    builder: (context) => const AlertDialog(
      title: Text('Liike'),
      content: SelectExercise(),
    ),
  );
}

class SelectExercise extends ConsumerWidget {
  const SelectExercise({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final searchTerm = BehaviorSubject<String>();

    void search(String term) => searchTerm.add(term);

    final Stream<List<Exercise>> exercises = searchTerm
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap((value) async* {
      yield await ref.read(searchExercisesProvider(value).future);
    });

    final Stream<bool> canCreate =
        searchTerm.debounceTime(const Duration(milliseconds: 300)).switchMap(
      (value) async* {
        yield (value.length > 2 &&
            !await ref.read(existsExerciseProvider(value).future));
      },
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Liikkeen nimi'),
          onChanged: (value) {
            search(value);
          },
        ),
        StreamBuilder(
          stream: exercises,
          builder: (context, snapshot) {
            final data = snapshot.data ?? [];
            return Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: data
                      .map((e) => _createExerciseListItem(context, e))
                      .toList(),
                ),
              ),
            );
          },
        ),
        StreamBuilder(
          stream: canCreate,
          builder: (context, snapshot) {
            final canCreate = snapshot.data ?? false;

            if (canCreate) {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    ref
                        .read(createExerciseProvider(searchTerm.value).future)
                        .then((exercise) => Navigator.pop(context, exercise));
                  },
                  child: const Text('Luo'),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }

  Widget _createExerciseListItem(BuildContext context, Exercise exercise) {
    return ListTile(
      title: Text(exercise.name),
      onTap: () {
        Navigator.pop(context, exercise);
      },
    );
  }
}
