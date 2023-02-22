import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jumpat/data/settings_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settingsTitle),
      ),
      body: const Center(
        child: ThemeSelect(),
      ),
    );
  }
}

class ThemeSelect extends HookConsumerWidget {
  const ThemeSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final t = AppLocalizations.of(context)!;

    return DropdownButton<ThemeMode>(
      value: themeMode,
      items: [
        DropdownMenuItem<ThemeMode>(
          value: ThemeMode.system,
          child: Text(t.systemOption),
        ),
        DropdownMenuItem<ThemeMode>(
          value: ThemeMode.light,
          child: Text(t.lightOption),
        ),
        DropdownMenuItem<ThemeMode>(
          value: ThemeMode.dark,
          child: Text(t.darkOption),
        ),
      ],
      onChanged: (value) {
        if (value != null) {
          ref.read(themeModeProvider.notifier).setThemeMode(value);
        }
      },
    );
  }
}
