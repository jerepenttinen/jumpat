import 'package:drift/drift.dart';

class Workouts extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
}

class Movements extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get weight => real()();
  IntColumn get exercise => integer().references(Exercises, #id)();
  IntColumn get workout => integer().references(Workouts, #id)();
}

class Sets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get count => integer()();
  IntColumn get movement => integer().references(Movements, #id)();
}

class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class Templates extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class TemplateMovements extends Table {
  IntColumn get template => integer().references(Templates, #id)();
  IntColumn get movement => integer().references(Movements, #id)();
  IntColumn get sets => integer()();
}
