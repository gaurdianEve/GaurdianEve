import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaurdianeve/model/fakecontact.dart';

class Calls extends StatelessWidget {
  const Calls({super.key, required this.contact});
  final FakeContact contact;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return  Scaffold(
      backgroundColor: Color(0xFF1d1d1d),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height/5,),
            Center(
              child: Text(
                "DAD",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 30.sp,
                ),
              ),
            ),
            SizedBox(height: height/2.5,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(Icons.alarm, color: Colors.white, size: 20),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "remind",
                        style: TextStyle(color: Color(0xFFFFFFFFF)),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.message, color: Colors.white, size: 20),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "message",
                        style: TextStyle(color: Color(0xFFFFFFFFF)),
                      )
                    ],
                  ),
                ]),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: (){

                      },

                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 35,
                        child: Icon(Icons.call, color: Colors.white, size: 30),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Accept",
                      style: TextStyle(color: Color(0xFFFFFFFFF)),
                    )
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 35,
                      child:
                          Icon(Icons.call_end, color: Colors.white, size: 30),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Decline",
                      style: TextStyle(color: Color(0xFFFFFFFFF)),
                    )
                  ],
                ),
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
