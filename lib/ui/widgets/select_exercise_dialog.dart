import 'package:flutter/material.dart';
import 'package:jumpat/data/isar_service.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/injection.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/transformers.dart';

Future<Exercise?> selectExerciseDialog(BuildContext context) async {
  return await showDialog<Exercise>(
    context: context,
    builder: (context) => const AlertDialog(
      title: Text('Liike'),
      content: SelectExercise(),
    ),
  );
}

class SelectExercise extends StatefulWidget {
  const SelectExercise({super.key});

  @override
  State<SelectExercise> createState() => _SelectExerciseState();
}

class _SelectExerciseState extends State<SelectExercise> {
  final _searchTerm = BehaviorSubject<String>();
  void search(String term) => _searchTerm.add(term);

  late final Stream<List<Exercise>> _exercises = _searchTerm
      .debounceTime(const Duration(milliseconds: 300))
      .switchMap((value) async* {
    yield await getIt<IsarService>().searchExercises(value);
  });
  Stream<List<Exercise>> get exercises => _exercises;

  late final Stream<bool> _canCreate =
      _searchTerm.debounceTime(const Duration(milliseconds: 300)).switchMap(
    (value) async* {
      yield (value.length > 2 &&
          !await getIt<IsarService>().existsExercise(value));
    },
  );
  Stream<bool> get canCreate => _canCreate;

  @override
  Widget build(BuildContext context) {
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
            return Column(
              children:
                  data.map((e) => _createExerciseListItem(context, e)).toList(),
            );
          },
        ),
        StreamBuilder(
          stream: canCreate,
          builder: (context, snapshot) {
            final canCreate = snapshot.data ?? false;

            if (canCreate) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    getIt<IsarService>()
                        .createExercise(_searchTerm.value)
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
