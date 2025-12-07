import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  static String id = "Chats Page";
  const ChatsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("chat page", style: TextStyle(fontSize: 24, color: KPurple)),
    );
  }
}
