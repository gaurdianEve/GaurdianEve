import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaurdianeve/Pages/chatPage.dart';
import 'package:gaurdianeve/components/friend_Message_Container.dart';
import 'package:gaurdianeve/components/lazyReload.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../constants.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});
  

  @override
  Widget build(BuildContext context) {
    ScreenUtil();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 10.sp),
          child: Text(
            'Messages',
            style: GoogleFonts.caveat(
                color: teal, fontSize: 22.sp, fontWeight: FontWeight.w700),
          ),
        ),
        _buildUserList()
      ],
    );
  }
}

Widget _buildUserList() {
  print("in widget");
  
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('friends')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("friend")
        .snapshots(),
    builder: (context, snapshot) {
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
      if (snapshot.hasError) {
        return const Text("Error");
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Text("Loading");
      }

      return Container(
        height: 400,
        width: double.infinity,
        child: ListView(
          children: snapshot.data!.docs.map<Widget>((doc) {
            String friendID =
                doc.get("friend"); // Assuming friend ID is the document ID

            return FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(friendID)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    
                    child:Center(child: LoadingAnimationWidget.stretchedDots(color: pink, size: 50)));
                }
                if (snapshot.hasError) {
                  return const Text("Error loading friend data");
                }

                // Assuming you have a 'name' field in your 'users' collection
                String friendName = snapshot.data!.get('username');
                String avatarUrl = snapshot.data!.get('avatarUrl');

                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatPage(
                                  recieverUID: friendID,
                                  recieveremail: friendName,
                                  avatar: avatarUrl,
                                  )));
                    },
                    child: FriendMessageContainer(username: friendName, avatar: avatarUrl,));
              },
            );
          }).toList(),
        ),
      );
    },
  );
}
