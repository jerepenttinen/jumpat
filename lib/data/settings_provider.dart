import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final settingsProvider = Provider<Settings>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return Settings(sharedPreferences: sharedPrefs);
});

class Settings {
  Settings({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  ThemeMode getThemeMode() {
    final mode = sharedPreferences.getInt('themeMode');
    if (mode == null) {
      return ThemeMode.system;
    }

    if (mode >= ThemeMode.values.length || mode < 0) {
      setThemeMode(themeMode: ThemeMode.system);
      return ThemeMode.system;
    }

    return ThemeMode.values[mode];
  }

  void setThemeMode({required ThemeMode themeMode}) {
    sharedPreferences.setInt('themeMode', themeMode.index);
  }
}

final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier(ref: ref);
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier({required this.ref}) : super(ThemeMode.system) {
    state = ref.watch(settingsProvider).getThemeMode();
  }

  Ref ref;

  void setThemeMode(ThemeMode themeMode) {
    ref.watch(settingsProvider).setThemeMode(themeMode: themeMode);
    state = ref.watch(settingsProvider).getThemeMode();
  }
}
