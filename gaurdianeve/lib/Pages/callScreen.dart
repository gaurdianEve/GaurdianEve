import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaurdianeve/components/callIcon.dart';
import 'package:gaurdianeve/constants.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackD,
      body: SafeArea(
        child: Column(

          children: [
            const SizedBox(height: 100,),
             Text(
              "00:00",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 18.sp,
                color: Colors.white
              ),
            ),
            const SizedBox(height: 8,),
             CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 40.sp,
              child: Image.asset("assets/images/person1.png"),
            ),
            const SizedBox(height: 10,),
            const Text(
              "DAD",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 40.0,
                color: Colors.white
              ),
            ),
            const SizedBox(height: 10,),
            const Text(
              "3424567323",
              textDirection: TextDirection.ltr,
              style: TextStyle(decoration: TextDecoration.none, fontSize: 16.0,color: Colors.white),
            ),
            const SizedBox(height: 100,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Row(
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Row(
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
            const SizedBox(height: 60,),
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
