import 'package:isar/isar.dart';

part 'template.g.dart';

@collection
class Template {
  Id? id;
  late List<TemplateMovement> movements;
}

@embedded
class TemplateMovement {
  late String name;
  late int count;
}
