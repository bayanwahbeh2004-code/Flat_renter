// services/chat_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // 1. Start chat with landlord
  Future<void> startChat({
    required String apartmentId,
    required String apartmentTitle,
    required String landlordName,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return;
    
    // Create unique chat ID
    String chatId = 'chat_${user.uid}_${apartmentId}';
    
    // Save chat in user's chat list
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
    
    // Also save for landlord (if we had landlord's user ID)
    // For now, just save for current user
  }
  
  // 2. Send message
  Future<void> sendMessage(String chatId, String message) async {
    final user = _auth.currentUser;
    if (user == null) return;
    
    // Save message
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add({
          'senderId': user.uid,
          'message': message,
          'timestamp': FieldValue.serverTimestamp(),
        });
    
    // Update last message
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
  
  // 3. Get my chat list
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
  
  // 4. Get messages for a chat
  Stream<QuerySnapshot> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}