import 'package:isar/isar.dart';
import 'package:jumpat/features/workout/infrastructure/models/collections.dart';

Future<Isar> openIsar() async {
  return Isar.open(
    [WorkoutSchema, MovementSchema, ExerciseSchema, TemplateSchema],
    name: 'testing',
  );
}
