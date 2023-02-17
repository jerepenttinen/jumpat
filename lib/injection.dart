import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:jumpat/data/template.dart';
import 'package:jumpat/data/workout.dart';
import 'package:jumpat/injection.config.dart';
import 'package:path_provider/path_provider.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() async {
  getIt.init();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [WorkoutSchema, TemplateSchema],
    name: 'jumpat',
    directory: dir.path,
  );

  getIt.registerSingleton<Isar>(isar);
}
