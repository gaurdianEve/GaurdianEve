import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  const Chat({
    required this.senderId,
    required this.senderEmail,
    required this.message,
    required this.recieverId,
    required this.timestamp,
  });
  final String senderId;
  final String senderEmail;
  final String message;
  final String recieverId;
  final Timestamp timestamp;
  
  Map<String,dynamic> toMap(){
    return {
      "senderId":senderId,
      "senderEmail":senderEmail,
      "message":message,
      "recieverId":recieverId,
      "timestamp":timestamp
    };

  }
}