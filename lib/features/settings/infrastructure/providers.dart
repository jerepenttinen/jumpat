import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/settings/domain/i_settings_repository.dart';
import 'package:jumpat/features/settings/infrastructure/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Override this');
});

final settingsRepositoryProvider = Provider<ISettingsRepository>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return SettingsRepository(sharedPreferences: sharedPreferences);
});
