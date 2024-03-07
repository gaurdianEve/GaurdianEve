import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaurdianeve/Pages/alert.dart';
import 'package:gaurdianeve/Pages/editInfo.dart';
import 'package:gaurdianeve/model/user.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.containerHeight,
    required this.width, required this.user,
  });

  final double containerHeight;
  final double width;
  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: containerHeight,
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(18)),
      child: Stack(
        children: [
          Positioned(
              left: 18,
              top: containerHeight - 160,
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 40,
                      child:
                          ClipOval(child: Image.asset("assets/images/avatars/${user.avatarURL}.png"))),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(user.username,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18.sp
                        )),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context) {
                          return  EditInfo( user: user,);
                        },));
                      },
                      child: Text("Edit info",
                          style: GoogleFonts.poppins(
                            color: Colors.grey.shade500,
                          )),
                    )
                  ])
                ],
              )),
          Positioned(
              left: width / 2 - 50,
              bottom: 3,
              child: SvgPicture.asset("assets/images/deco1.svg")),
          Positioned(
              left: -80,
              top: 0,
              child: SvgPicture.asset("assets/images/deco2.svg")),
          Positioned(
              right: -80,
              top: 0,
              child: SvgPicture.asset("assets/images/deco3.svg")),
        ],
      ),
    );
  }
}
