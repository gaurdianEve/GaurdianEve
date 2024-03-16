import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../components/bubble.dart';
import '../../../../messages/chatServices.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatPage extends StatefulWidget {
  final String recieverUID;
  final String recieveremail;
  final String avatar;
  const ChatPage(
      {super.key,
      required this.recieverUID,
      required this.recieveremail,
      required this.avatar});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _chatServices = ChatServices();
  final _firebaseAuth = FirebaseAuth.instance;
  final _chatTextController = TextEditingController();

Future<void> sendMessage() async {
  if (_chatTextController.text.isNotEmpty) {
    _chatServices.sendMessages(widget.recieverUID, _chatTextController.text);
    // Get the receiver's token from Firestore
    final receiverToken = await _getReceiverToken(widget.recieverUID);
    if (receiverToken != null) {
      sendNotification(receiverToken, "Message from ${widget.recieveremail}", _chatTextController.text);
    }
    _chatTextController.clear();
  }
}

Future<String?> _getReceiverToken(String receiverUID) async {
  final userDoc = await FirebaseFirestore.instance.collection('users').doc(receiverUID).get();
  if (userDoc.exists) {
    final userData = userDoc.data() as Map<String, dynamic>;
    return userData['token'] as String?;
  }
  return null;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: SafeArea(
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    FontAwesomeIcons.chevronLeft,
                    color: pink,
                  )),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: ClipOval(
                      child: Image.asset(
                          "assets/images/avatars/${widget.avatar}.png")),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                widget.recieveremail,
                style: GoogleFonts.poppins(color: pink, fontSize: 18.sp),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFFFFEBFC),
        elevation: 0.15,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          //widget for the messges
          children: [Expanded(child: _buildMessageList()), _textField()],

          //inputfield
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatServices.getMessages(
          widget.recieverUID, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildmesssage(document))
              .toList(),
        );
      },
    );
  }

  Widget _buildmesssage(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    CrossAxisAlignment aligment =
        _firebaseAuth.currentUser!.uid == data['recieverId']
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end;

    return ChatBubble(
        senderEmail: data['senderEmail'],
        aligment: aligment,
        message: data['message']);
  }

  Widget _textField() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _chatTextController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color(0xFFFFEBFC),
              contentPadding: EdgeInsets.all(8),
              hintText: 'send message',
            ),
          ),
        ),
        IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              FontAwesomeIcons.envelope,
              color: grey,
            ))
      ],
    );
  }
}

Future<void> sendNotification(String token, String title, String body) async {
  final url =
      'https://gregarious-dasik-bbe218.netlify.app/.netlify/functions/sendNotification';
  final headers = {
    'Content-Type': 'application/json',
  };
  final bodyData = {
    'token': token,
    'notification': {'title': title, 'body': body},
  };

  try {
    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(bodyData));

    if (response.statusCode == 200) {
      print('Notification sent successfully');
      
    } else {
      print('Failed to send notification. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error sending notification: $e');
  }
}
