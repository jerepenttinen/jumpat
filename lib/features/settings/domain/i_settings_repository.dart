import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ISettingsRepository {
  Locale getLocale();
  void setLocale(SupportedLocale locale);
  int getDefaultRepetitionCount();
  void setDefaultRepetitionCount(int count);
}

enum SupportedLocale { system, finnish }
