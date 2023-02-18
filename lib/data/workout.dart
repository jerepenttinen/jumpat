import 'package:isar/isar.dart';

part 'workout.g.dart';

@collection
class Workout {
  Id id = Isar.autoIncrement;
  late DateTime date;
  final movements = IsarLinks<Movement>();
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
