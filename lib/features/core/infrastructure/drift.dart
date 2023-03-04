import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'drift.g.dart';
part '../../workout/infrastructure/models/tables.dart';

@DriftDatabase(
  tables: [
    Exercises,
    Workouts,
    Movements,
    MovementSets,
    Templates,
    TemplatesExercises,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'jumpat.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
