import 'package:cloud_firestore/cloud_firestore.dart';

class Invite {
  String docID = "";
  String reciverID;
  String byUser;
  String senderUsername; // New field
  String status;
  Timestamp timestamp;

  Invite({
    required this.byUser,
    required this.reciverID,
    required this.senderUsername, // New field
    required this.status,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'reciverID': this.reciverID,
      'byUser': this.byUser,
      'senderUsername': this.senderUsername, // Updated field
      'status': this.status,
      'timestamp': this.timestamp
    };
  }

  factory Invite.fromJson(Map<String, dynamic> json) {
    return Invite(
      byUser: json['byUser'],
      reciverID: json['reciverID'],
      senderUsername: json['senderUsername'], // Updated field
      status: json['status'],
      timestamp: json['timestamp']
    );
  }

  Invite copyWith({
    String? docID,
    String? byUser,
    String? reciverID,
    String? senderUsername,
    String? status,
    Timestamp? timestamp,
  }) {
    return Invite(
      byUser: byUser ?? this.byUser,
      reciverID: reciverID ?? this.reciverID,
      senderUsername: senderUsername ?? this.senderUsername,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp
    );
  }

  @override
  String toString() {
    return 'User{id: $byUser, username: $reciverID, senderUsername: $senderUsername, email: $status, avatarURL: $timestamp}';
  }
}
