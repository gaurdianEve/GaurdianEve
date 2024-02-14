import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';


class FakeCallInstructionContainer extends StatelessWidget {
  const FakeCallInstructionContainer({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(horizontal: 22,vertical: 16),
      decoration: const  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Fake",
                  style: GoogleFonts.getFont("Montserrat",
                      color: pink,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      ),
                ),
                TextSpan(
                  text: "Call",
                  style: GoogleFonts.caveat(
                      color: grey,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Text(
            "Place a fake phone call and pretend you are talking to someone",
            style: GoogleFonts.poppins(
                      color: grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
        ],
      ),
    );
  }
}
