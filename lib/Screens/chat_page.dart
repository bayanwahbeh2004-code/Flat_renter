import 'package:baytech/Models/message.dart';
import 'package:baytech/components/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';

  final CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );
  final TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var myCurrentEmail = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text('Chat'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: messages
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Message> messagesList = [];
                  for (var doc in snapshot.data!.docs) {
                    messagesList.add(
                      Message.fromJson(doc.data() as Map<String, dynamic>),
                    );
                  }

                  return ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].myID == myCurrentEmail
                          ? ChatBuble(message: messagesList[index])
                          : ChatBuble2(message: messagesList[index]);
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) => _sendMessage(data, myCurrentEmail),
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: IconButton(
                  onPressed: () =>
                      _sendMessage(controller.text, myCurrentEmail),
                  icon: const Icon(
                    Icons.send,
                    color: Color.fromARGB(255, 100, 105, 109),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text, String email) {
    if (text.trim().isNotEmpty) {
      messages.add({
        'message': text,
        'myID': email,
        'destinationId': 'mrsl',
        'createdAt': DateTime.now(),
      });
      controller.clear();
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
}
