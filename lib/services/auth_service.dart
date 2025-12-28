// services/auth_service_firebase.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServiceFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<void> autoCreateFirebaseAccount({
    required int laravelUserId,
    required String name,
    required String profilePicture,
    required String phoneNumber,
  }) async {
    try {
      String email = "$phoneNumber@gmail.com";
      String password = "$phoneNumber$laravelUserId";

      print("Creating Firebase account for: $email");
      try {
        await _auth.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        );
        await _auth.signInWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        );
      } on FirebaseAuthException catch (e) {
        print(e.toString());
      }
      final user = _auth.currentUser;
      if (user == null) {
        print("No Firebase user after login/create");
        return;
      }
      await _firestore.collection('Users').doc(user.uid).set({
        'laravel_id': laravelUserId,
        'name': name,
        'profilePicture': profilePicture,
        'firebase_uid': user.uid,
        'email': email,
        'phone': phoneNumber,
        'created_at': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      print("Firebase account synced successfully!");
    } catch (e) {
      print("Error in autoCreateFirebaseAccount: ${e.toString()}");
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
