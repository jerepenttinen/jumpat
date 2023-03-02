import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/settings/domain/i_settings_repository.dart';
import 'package:jumpat/features/settings/domain/providers.dart';

class LocaleSelect extends HookConsumerWidget {
  const LocaleSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeStateProvider);
    final t = AppLocalizations.of(context)!;

    return DropdownButtonFormField<SupportedLocale>(
      decoration: InputDecoration(labelText: t.localeSetting),
      value: locale.languageCode == 'fi'
          ? SupportedLocale.finnish
          : SupportedLocale.system,
      items: [
        DropdownMenuItem<SupportedLocale>(
          value: SupportedLocale.system,
          child: Text(t.systemOption),
        ),
        DropdownMenuItem<SupportedLocale>(
          value: SupportedLocale.finnish,
          child: Text(t.finnish),
        ),
      ],
      onChanged: (value) {
        if (value != null) {
          ref.read(localeStateProvider.notifier).set(value);
        }
      },
    );
  }
}
