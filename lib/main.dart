import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:jumpat/data/isar_service.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/data/settings_provider.dart';
import 'package:jumpat/ui/routes/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/tables.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [WorkoutSchema, MovementSchema, ExerciseSchema, TemplateSchema],
    inspector: true,
    name: 'jumpat',
    directory: dir.path,
  );

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        isarServiceProvider.overrideWithValue(IsarService(isar: isar)),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, ref) {
    final providedLocale = ref.watch(localeProvider);

    return MaterialApp.router(
      locale: providedLocale,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.name,
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
