import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaurdianeve/model/chat.dart';

class ChatServices extends ChangeNotifier {
  final firebaseAuth = FirebaseAuth.instance;
  final fireBaseStore = FirebaseFirestore.instance;

  
  Future<void> sendMessages(String recieverId, String message) async {
    String currentUserId = firebaseAuth.currentUser!.uid;
    String currentUserEmail = firebaseAuth.currentUser!.email.toString();
    Timestamp timestamp = Timestamp.now();
    Chat chat = Chat(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        message: message,
        recieverId: recieverId,
        timestamp: timestamp);
    List<String> ids = [currentUserId, recieverId];
    ids.sort();
    String chatroomID = ids.join("-");
    await fireBaseStore
        .collection('chatrooms')
        .doc(chatroomID)
        .collection('messages')
        .add(chat.toMap());
  }

  Stream<QuerySnapshot> getMessages(String currentId, String otherUserId) {
    List<String> ids = [currentId, otherUserId];
    ids.sort();
    String chatroomID = ids.join("-");

    return fireBaseStore
        .collection('chatrooms')
        .doc(chatroomID)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
