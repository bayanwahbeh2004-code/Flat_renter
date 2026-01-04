import 'package:baytech/Constants.dart';
import 'package:baytech/generated/l10n.dart';
import 'package:flutter/material.dart';

void showToDoSomeThingDialoge(
  BuildContext context, {
  required String message,
  Future<dynamic> Function()? toDo,
  bool cancel = false,
  String? whereTo,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(
          message,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        actions: [
          if (cancel)
            TextButton(
              child: Text(
                S.of(context).cancel,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          TextButton(
            child: Text(
              S.of(context).ok,
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            onPressed: () async {
              bool ok = false;
              Navigator.pop(context);
              if (toDo != null) {
                await toDo();
                ok = true;
              }
              if (ok) {
                if (whereTo != null)
                  Navigator.popAndPushNamed(context, whereTo);
              }
            },
          ),
        ],
      );
    },
  );
}
