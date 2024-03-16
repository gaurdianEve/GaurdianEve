import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaurdianeve/Pages/MainScreen/HomeScreens/FakeCallScreen/callScreen.dart';
import 'package:gaurdianeve/Pages/MainScreen/HomeScreens/FakeCallScreen/updateFakeCallScreen.dart';
import 'package:gaurdianeve/model/fakecontact.dart';

import '../constants.dart';
import 'package:google_fonts/google_fonts.dart';

class FakeCallContactContainer extends StatelessWidget {
  const FakeCallContactContainer({super.key, required this.contact});
  final FakeContact contact;

  @override
  Widget build(BuildContext context) {
    ScreenUtil();
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.blueAccent,
            child: Text(
              contact.callName[0].toUpperCase(),
              style: GoogleFonts.poppins(fontSize: 28.sp,color: Color(0xFFFFFFFFF)),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contact.callName,
                style: GoogleFonts.poppins(fontSize: 18.sp),
              ),
              Text(
                contact.phoneNo,
                style: GoogleFonts.poppins(),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                    return UpdateFakeCallAddScreen(firstContact: contact,);
                  },));
                },
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: teal,
                  child: SvgPicture.asset("assets/images/edit.svg"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                    return CallScreen(contact:contact ,);
                  },));
                },
                child: CircleAvatar(
                    backgroundColor: pink,
                    child: SvgPicture.asset("assets/images/phone.svg")),
              ),
            ],
          )
        ],
      ),
    );
  }
}
