import 'package:cloud_firestore/cloud_firestore.dart';

class Invite {
  String docID = "";
  String reciverID;
  String byUser;
  String status;
  Timestamp timestamp;

  Invite({
    
    required this.byUser,
    required this.reciverID,
    required this.status,
    required this.timestamp,
  });
  Map<String, dynamic> toJson() {
    return {
      'reciverID': this.reciverID,
      'byUser': this.byUser,
      'status': this.status,
      'timestamp': this.timestamp
    };
  }

  factory Invite.fromJson(Map<String, dynamic> json) {
    return Invite(
       
        byUser: json['byUser'],
        reciverID: json['reciverID'],
        status: json['status'],
        timestamp: json['timestamp']);
  }

  Invite copyWith({
    String? docID,
    String? byUser,
    String? reciverID,
    String? status,
    Timestamp? timestamp,
  }) {
    return Invite(
        byUser: byUser ?? this.byUser,
        reciverID: reciverID ?? this.reciverID,
        status: status ?? this.status,
        timestamp: timestamp ?? this.timestamp);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'User{id: $byUser, username: $reciverID, email: $status, avatarURL: $timestamp}';
  }
}
