
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get message stream
  Stream<QuerySnapshot> getMessages() {
    return _firestore
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  // Send a new message
  Future<void> sendMessage(String message) async {
    await _firestore.collection('messages').add({
      'text': message,
      'timestamp': FieldValue.serverTimestamp(),
      'isRemote': false, // Assume messages sent from the app are not remote
    });
  }
}
