import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<bool?> confirmDelete(BuildContext context) async {
  final t = AppLocalizations.of(context)!;
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(t.confirmationTitle),
        content: Text(t.confirmationContent),
        actions: [
          TextButton(
            onPressed: () {
              if (!context.mounted) {
                return;
              }
              Navigator.of(context).pop(true);
            },
            child: Text(t.delete),
          ),
          TextButton(
            onPressed: () {
              if (!context.mounted) {
                return;
              }
              Navigator.of(context).pop(false);
            },
            child: Text(t.cancel),
          ),
        ],
      );
    },
  );
}
