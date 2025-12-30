// services/chat_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> startChat({
    required String apartmentId,
    required String apartmentTitle,
    required String landlordName,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return;

    String chatId = 'chat_${user.uid}_${apartmentId}';

    await _firestore
        .collection('user_chats')
        .doc(user.uid)
        .collection('chats')
        .doc(chatId)
        .set({
          'chatId': chatId,
          'apartmentId': apartmentId,
          'apartmentTitle': apartmentTitle,
          'landlordName': landlordName,
          'lastMessage': 'Chat started',
          'lastMessageTime': FieldValue.serverTimestamp(),
          'createdAt': FieldValue.serverTimestamp(),
        });
  }

  Future<void> sendMessage(String chatId, String message) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add({
          'senderId': user.uid,
          'message': message,
          'timestamp': FieldValue.serverTimestamp(),
        });

    await _firestore
        .collection('user_chats')
        .doc(user.uid)
        .collection('chats')
        .doc(chatId)
        .update({
          'lastMessage': message,
          'lastMessageTime': FieldValue.serverTimestamp(),
        });
  }

  Stream<QuerySnapshot> getMyChats() {
    final user = _auth.currentUser;
    if (user == null) return const Stream.empty();

    return _firestore
        .collection('user_chats')
        .doc(user.uid)
        .collection('chats')
        .orderBy('lastMessageTime', descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
