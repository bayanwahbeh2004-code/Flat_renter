import 'package:baytech/Constants.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';

void showToDoSomeThingDialoge(
  BuildContext context, {
  required String message,
  Future<dynamic>? toDo,
  Future<dynamic>? toDo2,
  bool cancel = false,
  required String whereTo,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(message),
        actions: [
          if (cancel)
            TextButton(
              child: const Text('cancel', style: TextStyle(color: KPurple)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          TextButton(
            child: const Text('ok', style: TextStyle(color: KPurple)),
            onPressed: () async {
              bool ok1 = false, ok2 = false;
              if (toDo != null) {
                await toDo;
                ok1 = true;
              }
              if (toDo2 != null) {
                await toDo2;
                ok2 = true;
              }
              if (ok1 && ok2) {
                Navigator.popAndPushNamed(context, whereTo);
              }
            },
          ),
        ],
      );
    },
  );
}
