import 'package:flutter/material.dart';

abstract class ISettingsRepository {
  Locale getLocale();
  void setLocale(SupportedLocale locale);
  int getDefaultRepetitionCount();
  void setDefaultRepetitionCount(int count);
}

enum SupportedLocale { system, finnish }
