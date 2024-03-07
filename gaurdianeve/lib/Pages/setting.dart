import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaurdianeve/Invitation/bloc/inivite_bloc.dart';
import 'package:gaurdianeve/Pages/helpAndService.dart';
import 'package:gaurdianeve/components/customeSnackBar.dart';
import 'package:gaurdianeve/components/option.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:gaurdianeve/model/invite.dart';
import 'package:gaurdianeve/model/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../components/userCard.dart';

class Setting extends StatelessWidget {
  const Setting({super.key, required this.user});
  final UserProfile user;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    double avatarContainerHeight = height / 4;
    double settingContainerHeight =
        height * aspectRatio; // Adjusted calculation
    TextEditingController inviteFieldController = TextEditingController();
    print(aspectRatio);
    ScreenUtil();
    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          children: [
            UserCard(
              containerHeight: avatarContainerHeight,
              width: width,
              user: user,
            ),
            const SizedBox(
              height: 28,
            ),
            Container(
              height: settingContainerHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(18)),
              child: ListView(children: [
                const Divider(
                  height: 10,
                  thickness: 0,
                  color: Colors.white,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return const Help();
                    },));
                  },
                  child: const Option(
                      asset: "assets/images/headset.svg",
                      name: "Help and Services"),
                ),
                Divider(
                  height: settingContainerHeight / 14,
                  color: Colors.grey.shade400,
                  thickness: 0,
                ),
                const Option(
                    asset: "assets/images/feedback.svg", name: "Feedback"),
                Divider(
                  height: settingContainerHeight / 14,
                  color: Colors.grey.shade400,
                  thickness: 0,
                ),
                const Option(
                    asset: "assets/images/noti.svg", name: "Notification"),
                Divider(
                  height: settingContainerHeight / 14,
                  color: Colors.grey.shade400,
                  thickness: 0,
                ),
                InkWell(
                  onTap: (){
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                            height: height / 3,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: scaffoldBackgroundColor,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextField(
                                    
                                    decoration: InputDecoration(
                                        constraints: BoxConstraints(
                                            minHeight: 45,
                                            maxHeight: 45,
                                            maxWidth: width,
                                            minWidth: width),
                                        hintText: 'phone No',
                                        hintStyle: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black,
                                            letterSpacing: 1,
                                            fontSize: 12.sp),
                                        filled: true,
                                        fillColor: const Color(0xFFF7F7F7),
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: SvgPicture.asset(
                                              "assets/images/user.svg"),
                                        ),
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(13)))),
                                  ),
                                  SizedBox(
                                    height: height / 20 * aspectRatio,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      //registerPhoneNumber("91737448380");
                                    sendMessage("1346d9b9","apiSecret","8446663631", "8446663631", "Hi");
                                    },
                                    child: Container(
                                      height: 45,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                          color: pink,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: Center(
                                          child: Text(
                                        "Send",
                                        style: GoogleFonts.poppins(
                                            fontSize: 18.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      },
                    );

                  },
                  child: const Option(
                      asset: "assets/images/noti.svg", name: "Notification"),
                ),
                Divider(
                  height: settingContainerHeight / 14,
                  color: Colors.grey.shade400,
                  thickness: 0,
                ),
                GestureDetector(
                  onTap: () => {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                            height: height / 3,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: scaffoldBackgroundColor,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextField(
                                    controller: inviteFieldController,
                                    decoration: InputDecoration(
                                        constraints: BoxConstraints(
                                            minHeight: 45,
                                            maxHeight: 45,
                                            maxWidth: width,
                                            minWidth: width),
                                        hintText: 'SenderID',
                                        hintStyle: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black,
                                            letterSpacing: 1,
                                            fontSize: 12.sp),
                                        filled: true,
                                        fillColor: const Color(0xFFF7F7F7),
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: SvgPicture.asset(
                                              "assets/images/user.svg"),
                                        ),
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(13)))),
                                  ),
                                  SizedBox(
                                    height: height / 20 * aspectRatio,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (inviteFieldController
                                          .text.isNotEmpty) {
                                        final Invite invite = Invite(
                                            senderUsername: user.username,
                                            byUser: FirebaseAuth
                                                .instance.currentUser!.uid,
                                            reciverID:
                                                inviteFieldController.text,
                                            status: "pending",
                                            timestamp: Timestamp.now());
                                        BlocProvider.of<IniviteBloc>(context)
                                            .add(SendInvite(invite));
                                        inviteFieldController.clear();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content:
                                              CustomeSnackBar(text: "Successfully Send!",icon: Icon(FontAwesomeIcons.check, color: Color(0xFFFFFFFF) ,),),
                          
                                        ));
                                      }
                                    },
                                    child: Container(
                                      height: 45,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                          color: pink,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: Center(
                                          child: Text(
                                        "Send",
                                        style: GoogleFonts.poppins(
                                            fontSize: 18.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      },
                    )
                  },
                  child: const Option(
                      asset: "assets/images/invite.svg", name: "Invite friend"),
                ),
                Divider(
                  height: settingContainerHeight / 14,
                  color: Colors.grey.shade400,
                  thickness: 0,
                ),
                const Option(
                    asset: "assets/images/logout.svg", name: "Log Out"),
              ]),
            )
          ],
        ),
      );
    
  }
}


Future<void> sendMessage(String apiKey,String apiSecret, String from, String to, String text) async {
  String apiUrl = 'https://api.nexmo.com/v0.1/messages';


  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Basic ' + base64Encode(utf8.encode('$apiKey:$apiSecret')),
  };

  Map<String, dynamic> body = {
    'from': {'type': 'whatsapp', 'number': from},
    'to': {'type': 'whatsapp', 'number': to},
    'message': {
      'content': {
        'type': 'text',
        'text': text,
      }
    }
  };

  try {
    http.Response response = await http.post(Uri.parse(apiUrl), headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200) {
      print('Message sent successfully');
    } else {
      print('Failed to send message: ${response.body}');
    }
  } catch (e) {
    print('Error sending message: $e');
  }
}
Future<void> registerPhoneNumber(String phoneNumber) async {
  String apiUrl = 'https://api.nexmo.com/camara/number-verification/v031/verify';


  Map<String, String> headers = {
    'Content-Type' : 'application/x-www-form-urlencoded',
  };


  Map<String, String> body = {
    'phoneNumber': phoneNumber,
    
  };

  try {
    http.Response response = await http.post(Uri.parse(apiUrl), headers: headers, body: body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == '0') {
        print('Phone number registered successfully');
      } else {
        print('Failed to register phone number: ${jsonResponse['error_text']}');
      }
    } else {
      print('Failed to register phone number: ${response.body}');
    }
  } catch (e) {
    print('Error registering phone number: $e');
  }
}