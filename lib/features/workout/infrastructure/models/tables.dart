part of '../../../core/infrastructure/drift.dart';

class Workouts extends Table {
  IntColumn get id => integer()();
  DateTimeColumn get date => dateTime()();
  IntColumn get template => integer().nullable().references(Templates, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

class Movements extends Table {
  IntColumn get id => integer()();
  RealColumn get weight => real()();
  IntColumn get exercise => integer().references(Exercises, #id)();
  IntColumn get workout => integer().references(Workouts, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

class MovementSets extends Table {
  IntColumn get id => integer()();
  IntColumn get count => integer()();
  IntColumn get movement => integer().references(Movements, #id)();

  @override
  Set<Column> get primaryKey => {id};
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
  IntColumn get template => integer().references(Templates, #id)();
  IntColumn get exercise => integer().references(Exercises, #id)();
}

// Tables with joined references

class WorkoutWithTemplate {
  WorkoutWithTemplate(this.workout, this.template);

  final Workout workout;
  final Template? template;
}

class MovementWithExerciseWorkoutSets {
  MovementWithExerciseWorkoutSets(
    this.movement,
    this.exercise,
    this.workout,
    this.sets,
  );

  final Movement movement;
  final Exercise exercise;
  final Workout workout;
  final List<MovementSet> sets;
}

class TemplateWithExercises {
  TemplateWithExercises(this.template, this.exercises);

  final Template template;
  final List<Exercise> exercises;
}
