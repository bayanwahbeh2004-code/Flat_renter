import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';

void showDialoge(
  BuildContext context, {
  required Widget child,
  bool ok = true,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: child,
        actions: [
          if (ok)
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
        ],
      );
    },
  );
}
