import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class OnboardScreen3 extends StatelessWidget {
  const OnboardScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        
        Positioned(
          top: height / 6,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 6 - 10),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Join Gaurdian",
                      style: GoogleFonts.getFont("Montserrat",
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 30.sp,
                          wordSpacing: -3,
                          letterSpacing: -0.5)),
                  TextSpan(
                      text: " Eve",
                      style: GoogleFonts.caveat(
                          color: teal,
                          fontSize: 35.sp,
                          fontWeight: FontWeight.w700)),
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "for a safer",
                      style: GoogleFonts.getFont("Montserrat",
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 32.sp,
                          letterSpacing: 0,
                          wordSpacing: -4)),
                  TextSpan(
                      text: " journey",
                      style: GoogleFonts.caveat(
                        color: teal,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      )),
                ]))
              ],
            ),
          ),
        ),
        Center(
          child: SvgPicture.asset("assets/images/UICompenent3.svg"),
        )
      ],
    );
  }
}
