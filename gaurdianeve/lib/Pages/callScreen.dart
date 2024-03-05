import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaurdianeve/components/callIcon.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:gaurdianeve/model/fakecontact.dart';
import 'package:google_fonts/google_fonts.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key, required this.contact});
  final FakeContact contact;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    ScreenUtil();
    return Scaffold(
      backgroundColor: blackD,
      body: SafeArea(
        child: Column(

          children: [
             SizedBox(height: height/16,),
             Text(
              "00:00",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 18.sp,
                color: Colors.white
              ),
            ),
             SizedBox(height: (height/20)*aspectRatio,),
             CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 40.sp,
              child: Text(contact.callName[0], style: GoogleFonts.poppins(fontSize: 42.sp, color:const  Color(0xFFFFFFFF)),),
            ),
            const SizedBox(height: 10,),
             Text(
              contact.callName,
              textDirection: TextDirection.ltr,
              style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 40.0,
                color: Colors.white
              ),
            ),
            const SizedBox(height: 10,),
             Text(
              contact.phoneNo,
              textDirection: TextDirection.ltr,
              style: const TextStyle(decoration: TextDecoration.none, fontSize: 16.0,color: Colors.white),
            ),
             SizedBox(height: height/12,),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: width/8),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CallIcon(
                    iconname: Icons.mic_off_outlined,
                    name: "Mute",
                  ),
                  CallIcon(
                    iconname: Icons.dialpad,
                    name: "Keypad",
                  ),
                  CallIcon(
                    iconname: Icons.volume_up_outlined,
                    name: "Speaker",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
             Padding(
              padding:  EdgeInsets.symmetric(horizontal: width/8),
              child: const  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CallIcon(
                    iconname: Icons.add_ic_call_outlined,
                    name: "Add Call",
                  ),
                  CallIcon(
                    iconname: Icons.pause,
                    name: "Hold",
                  ),
                  CallIcon(
                    iconname: Icons.sms_outlined,
                    name: "Message",
                  ),
                ],
              ),
            ),
             SizedBox(height: height/16,),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CircleAvatar(
                backgroundColor: Colors.red,
                radius: 36,
                child: Icon(
                  Icons.call_end_outlined,
                  color:whiteD,
                  size: 35,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
