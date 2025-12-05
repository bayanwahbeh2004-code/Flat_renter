import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';

void showDialoge(BuildContext context, {required String message}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(message),
        actions:[
          TextButton(
            child: const Text('OK', style: TextStyle(color: KPurple)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
