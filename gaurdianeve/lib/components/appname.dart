import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class AppName extends StatelessWidget {
  const AppName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "   Gaurdian",
            style: GoogleFonts.getFont("Montserrat",
                color: grey,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                wordSpacing: -3,
                letterSpacing: -1),
          ),
          TextSpan(
            text: "Eve",
            style: GoogleFonts.caveat(
                color: grey, fontSize: 25.sp, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
