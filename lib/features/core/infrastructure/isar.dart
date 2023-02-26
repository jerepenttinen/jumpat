import 'package:isar/isar.dart';
import 'package:jumpat/features/workout/infrastructure/models/collections.dart';
import 'package:path_provider/path_provider.dart';

Future<Isar> openIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(
    [WorkoutSchema, MovementSchema, ExerciseSchema, TemplateSchema],
    name: 'jumpat',
    directory: dir.path,
  );
}
