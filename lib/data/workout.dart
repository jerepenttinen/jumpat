import 'package:isar/isar.dart';

part 'workout.g.dart';

@collection
class Workout {
  Id? id;
  late DateTime date;
  late List<Movement> movements;
}

@embedded
class Movement {
  late String name;
  late double weight;
  late List<int> sets;
}
