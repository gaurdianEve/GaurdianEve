import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaurdianeve/Invitation/bloc/inivite_bloc.dart';
import 'package:gaurdianeve/components/option.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:gaurdianeve/model/invite.dart';
import 'package:gaurdianeve/model/user.dart';
import 'package:google_fonts/google_fonts.dart';

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
                const Option(
                    asset: "assets/images/headset.svg",
                    name: "Help and Services"),
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
                                              Text('Request Send Succesfully'),
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
