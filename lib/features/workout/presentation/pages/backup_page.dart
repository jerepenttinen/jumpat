import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/core/providers.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class BackupPage extends ConsumerWidget {
  const BackupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(t.backupTitle)),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text(t.importDatabase),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles();
                if (result == null) {
                  return;
                }

                try {
                  final newDb = File(result.files.single.path!);
                  final headerString =
                      await newDb.openRead(0, 16).transform(utf8.decoder).first;
                  if (!headerString.contains('SQLite format 3')) {
                    // :-D
                    throw Exception();
                  }

                  final dbFolder = await getApplicationDocumentsDirectory();

                  await newDb.copy(p.join(dbFolder.path, 'jumpat.sqlite'));

                  if (context.mounted) {
                    ref.invalidate(appDatabaseProvider);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(t.databaseImported)),
                    );
                    Navigator.of(context).pop();
                  }
                } on Exception {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(t.invalidFileFormat)),
                    );
                  }
                  return;
                }
              },
            ),
            TextButton(
              onPressed: () async {
                final dbFolder = await getApplicationDocumentsDirectory();
                final dbPath = p.join(dbFolder.path, 'jumpat.sqlite');
                await Share.shareXFiles(
                  [
                    XFile(dbPath),
                  ],
                  text: 'database',
                );
              },
              child: Text(t.exportDatabase),
            )
          ],
        ),
      ),
    );
  }
}
