import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeSnackBar extends StatelessWidget {
  const CustomeSnackBar({
    super.key, required this.text, required this.icon,
  });
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Stack(
        
        children: [
        Container(
          height: 75,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: pink.withAlpha(50),
                spreadRadius: 2,
                blurRadius: 30,
                offset: const Offset(
                    0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: pink,
                child: icon
              ),
              const SizedBox(width: 50),
              Text(
                text,
                style: GoogleFonts.poppins(
                    fontSize: 14.sp, color: grey),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 5,
            color: pink,
          ),
        ),
      ]),
    );
  }
}
