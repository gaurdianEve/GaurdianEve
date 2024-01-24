import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardScreen1 extends StatelessWidget {
  const OnboardScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
     double width = MediaQuery.of(context).size.width;
   double height = MediaQuery.of(context).size.height;
    return  Stack(
      children: [
        Positioned(
          top: height/5,
          left: width/2-150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: "Your Security",style: GoogleFonts.getFont("Montserrat",color: Colors.black,fontWeight:FontWeight.w700,fontSize: 30.sp)),
                  TextSpan(text: " Ally",style: GoogleFonts.caveat(color: teal,fontSize: 35.sp,fontWeight: FontWeight.w700)),
                ]
              )),
              RichText(text: TextSpan(
            children: [
              TextSpan(text: "Gaurdian",style: GoogleFonts.getFont("Montserrat",color: Colors.black,fontWeight:FontWeight.w700,fontSize: 30.sp)),
              TextSpan(text: "Eve",style: GoogleFonts.caveat(color: teal,fontSize: 35.sp,fontWeight: FontWeight.w700)),
            ]
          ))
            ],
          ),
        ),
        
        Center(
          child: SvgPicture.asset("assets/images/UICompenent1.svg"),
          
        )

      ],
    );
  }
}