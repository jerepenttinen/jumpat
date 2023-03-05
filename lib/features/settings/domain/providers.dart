import 'package:flutter/material.dart';
import 'package:jumpat/features/settings/domain/i_settings_repository.dart';
import 'package:jumpat/features/settings/infrastructure/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
class LocaleState extends _$LocaleState {
  @override
  Locale build() {
    final repo = ref.watch(settingsRepositoryProvider);
    return repo.getLocale();
  }

  Locale get() {
    return state;
  }

  void set(SupportedLocale newLocale) {
    final repo = ref.watch(settingsRepositoryProvider)..setLocale(newLocale);

    state = repo.getLocale();
  }
}

@Riverpod(keepAlive: true)
class DefaultRepetitionCount extends _$DefaultRepetitionCount {
  @override
  int build() {
    final repo = ref.watch(settingsRepositoryProvider);
    return repo.getDefaultRepetitionCount();
  }

  int get() {
    return state;
  }

  void set(int newRepetitionCount) {
    final repo = ref.watch(settingsRepositoryProvider)
      ..setDefaultRepetitionCount(newRepetitionCount);

    state = repo.getDefaultRepetitionCount();
  }
}
