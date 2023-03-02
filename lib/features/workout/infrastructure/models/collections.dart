import 'package:isar/isar.dart';
import 'package:jumpat/features/core/infrastructure/fast_hash.dart';

part 'collections.g.dart';

@collection
class Workout {
  late String id;
  Id get isarId => fastHash(id);

  late DateTime date;

  final template = IsarLink<Template>();

  @Backlink(to: 'workout')
  final movements = IsarLinks<Movement>();
}

@collection
class Movement {
  late String id;
  Id get isarId => fastHash(id);

  late double weight;
  late List<int> sets;

  final workout = IsarLink<Workout>();

  final exercise = IsarLink<Exercise>();
}

@collection
class Exercise {
  late String id;
  Id get isarId => fastHash(id);

  late String name;

  @Backlink(to: 'exercise')
  final movements = IsarLinks<Movement>();
}

@collection
class Template {
  late String id;
  Id get isarId => fastHash(id);

  late String name;
  late int color;
  final exercises = IsarLinks<Exercise>();

  @Backlink(to: 'template')
  final workouts = IsarLinks<Workout>();
}
