// screens/chat_list_screen.dart
import 'package:baytech/Screens/chat_page.dart';
import 'package:baytech/generated/l10n.dart';
import 'package:baytech/services/chat_services.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatListScreen extends StatelessWidget {
  static const String id = 'chat_list_screen';
  final ChatService _chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _chatService.getMyChats(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text(S.of(context).no_chats));
          }
          final chats = snapshot.data!.docs;
          return ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chat = chats[index].data() as Map<String, dynamic>;
              return ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),
                title: Text(
                  chat['landlordName'] ?? S.of(context).default_landlord,
                ),
                subtitle: Text(chat['apartmentTitle']),
                trailing: Text(
                  _formatTime(chat['lastMessageTime']),
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        chatId: chat['chatId'],
                        landlordName: chat['landlordName'],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  String _formatTime(Timestamp timestamp) {
    final time = timestamp.toDate();
    return '${time.hour}:${time.minute}';
  }
}
