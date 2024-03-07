import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/bubble.dart';
import '../messages/chatServices.dart';




class ChatPage extends StatefulWidget {
  final String recieverUID;
  final String recieveremail;
  final String avatar;
  const ChatPage({
    super.key,
    required this.recieverUID,
    required this.recieveremail, required this.avatar
  });
  
  

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
final _chatServices = ChatServices();
final _firebaseAuth = FirebaseAuth.instance;
final _chatTextController  = TextEditingController();

void sendMessage(){
  if (_chatTextController.text.isNotEmpty) {
    _chatServices.sendMessages(widget.recieverUID, _chatTextController.text);
    _chatTextController.clear();
  }
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        
        leadingWidth:double.infinity ,
        leading: SafeArea(
          child: Row(
            children: [
              const SizedBox(width: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                
                child: const Icon(FontAwesomeIcons.chevronLeft,color: pink,)),
              const SizedBox(width: 20,),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(child: ClipOval(child: Image.asset("assets/images/avatars/${widget.avatar}.png")),),
              
            ),
            const SizedBox(width: 20,),
            Text(widget.recieveremail,
          style: GoogleFonts.poppins(color: pink,fontSize: 18.sp),
          ),
            ],
          ),
        ),
        
        backgroundColor: const Color(0xFFFFEBFC),
        elevation: 0.15,

        


      ),
      body:   Padding(
        padding: const EdgeInsets.symmetric(horizontal:10 ),
        child: Column(
          //widget for the messges
          children: [
            Expanded(child: _buildMessageList()),
            _textField()
            
          ],
          
          //inputfield
        ),
      ),
    );
  }
  Widget _buildMessageList(){
    return StreamBuilder(
      stream: _chatServices.getMessages(widget.recieverUID, _firebaseAuth.currentUser!.uid),
      builder:(context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
          
        }
        if (snapshot.connectionState==ConnectionState.waiting) {
          return const CircularProgressIndicator();
          
        }
         return ListView(
            children: snapshot.data!.docs.map((document) => _buildmesssage(document)).toList(),
         );
      
    },);
  }
  Widget _buildmesssage(DocumentSnapshot doc){
    Map <String ,dynamic> data = doc.data() as Map<String, dynamic>;
    CrossAxisAlignment aligment  = _firebaseAuth.currentUser!.uid==data['recieverId']?CrossAxisAlignment.start:CrossAxisAlignment.end;

    return ChatBubble(senderEmail: data['senderEmail'], aligment: aligment, message: data['message']);
  }
  Widget _textField(){
    return  Row(
      children: [
          Expanded(
            child: TextField(
              controller:_chatTextController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFFFFEBFC),
                contentPadding: EdgeInsets.all(8),
    hintText: 'send message',
  ),
          
            ),
          ),
          IconButton(onPressed:sendMessage, icon: const  Icon(FontAwesomeIcons.envelope,color: grey,))
      ],
    );
  }
}

