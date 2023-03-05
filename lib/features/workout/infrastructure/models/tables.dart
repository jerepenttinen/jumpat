part of '../../../core/infrastructure/drift.dart';

class Workouts extends Table {
  IntColumn get id => integer()();
  DateTimeColumn get date => dateTime()();
  IntColumn get template => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints =>
      ['FOREIGN KEY (template) REFERENCES templates (id) ON DELETE SET NULL'];
}

class Movements extends Table {
  IntColumn get id => integer()();
  RealColumn get weight => real()();
  IntColumn get exercise => integer().references(Exercises, #id)();
  IntColumn get workout => integer().references(Workouts, #id)();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
        'FOREIGN KEY (workout) REFERENCES workouts (id) ON DELETE CASCADE',
        'FOREIGN KEY (exercise) REFERENCES exercises (id) ON DELETE RESTRICT',
      ];
}

class MovementSets extends Table {
  IntColumn get id => integer()();
  IntColumn get count => integer()();
  IntColumn get movement => integer()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints =>
      ['FOREIGN KEY (movement) REFERENCES movements (id) ON DELETE CASCADE'];
}

class Exercises extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class Templates extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  IntColumn get color => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class TemplatesExercises extends Table {
  IntColumn get template => integer()();
  IntColumn get exercise => integer()();

  @override
  Set<Column> get primaryKey => {template, exercise};

  @override
  List<String> get customConstraints => [
        'FOREIGN KEY (template) REFERENCES templates (id) ON DELETE CASCADE',
        'FOREIGN KEY (exercise) REFERENCES exercises (id) ON DELETE CASCADE',
      ];
}
