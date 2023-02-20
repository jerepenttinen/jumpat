import 'package:flutter/material.dart';

Future<bool> confirmDelete(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Varmista'),
        content: const Text('Oletko varma että haluat poistaa tämän.'),
        actions: [
          TextButton(
            onPressed: () {
              if (!context.mounted) {
                return;
              }
              Navigator.of(context).pop(true);
            },
            child: const Text('Poista'),
          ),
          TextButton(
            onPressed: () {
              if (!context.mounted) {
                return;
              }
              Navigator.of(context).pop(false);
            },
            child: const Text('Peruuta'),
          ),
        ],
      );
    },
  );
}
