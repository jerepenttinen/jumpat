import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jumpat/features/settings/domain/i_settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository implements ISettingsRepository {
  SettingsRepository({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  int getDefaultRepetitionCount() {
    final repCount = sharedPreferences.getInt('defaultRepCount');
    if (repCount == null) {
      return 10;
    }

    if (repCount > 30 || repCount < 0) {
      setDefaultRepetitionCount(10);
      return 10;
    }

    return repCount;
  }

  @override
  Locale getLocale() {
    final l = sharedPreferences.getInt('locale');

    String locale;
    if (Platform.localeName.contains('_')) {
      locale = Platform.localeName.split('_').first;
    } else {
      locale = Platform.localeName;
    }

    if (l == null) {
      return Locale(locale);
    }
    if (l >= SupportedLocale.values.length || l < 0) {
      setLocale(SupportedLocale.system);
      return Locale(locale);
    }

    if (l == SupportedLocale.finnish.index) {
      return const Locale('fi');
    }
    return Locale(locale);
  }

  @override
  void setDefaultRepetitionCount(int count) {
    sharedPreferences.setInt('defaultRepCount', count);
  }

  @override
  void setLocale(SupportedLocale locale) {
    sharedPreferences.setInt('locale', locale.index);
  }
}
