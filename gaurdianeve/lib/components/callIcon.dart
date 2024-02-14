import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gaurdianeve/constants.dart';

class CallIcon extends StatelessWidget {
  const CallIcon({super.key, required this.iconname, required this.name});
  final IconData iconname;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: whiteD,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            iconname,
            color: whiteD,
            size: 26,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          name,
          style: GoogleFonts.poppins(fontSize: 11.sp, color: whiteD),
        )
      ],
    );
  }
}
