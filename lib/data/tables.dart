import 'package:isar/isar.dart';

part 'tables.g.dart';

@collection
class Workout {
  Id id = Isar.autoIncrement;
  late DateTime date;
  final movements = IsarLinks<Movement>();
  final template = IsarLink<Template>();
}

@collection
class Movement {
  Id id = Isar.autoIncrement;
  late double weight;
  late List<int> sets;

  @Backlink(to: 'movements')
  final workout = IsarLink<Workout>();

  @Backlink(to: 'movements')
  final exercise = IsarLink<Exercise>();
}

@collection
class Exercise {
  Id id = Isar.autoIncrement;
  late String name;
  final movements = IsarLinks<Movement>();
}

@collection
class Template {
  Id id = Isar.autoIncrement;
  late String name;
  late int color;
  final exercises = IsarLinks<Exercise>();

  @Backlink(to: 'template')
  final workouts = IsarLinks<Workout>();
}
