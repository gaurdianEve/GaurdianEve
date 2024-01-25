import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class OnboardScreen2 extends StatelessWidget {
  const OnboardScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          top: height/6,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: width/6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "Alert ",style: GoogleFonts.getFont("Montserrat",color: Colors.black,fontWeight:FontWeight.w700,fontSize: 30.sp,letterSpacing: 2)),
                    TextSpan(text: "you to a",style: GoogleFonts.getFont("Montserrat",color: Colors.black,fontWeight:FontWeight.w700,fontSize: 30.sp,)),
                  ]
                )),
                Text("Potential",style: GoogleFonts.montserrat(color: pink, fontSize: 35.sp,fontWeight: FontWeight.w700)),
                Text("Danger Zone",style: GoogleFonts.montserrat(color: pink,fontSize: 35.sp,fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ),
        
        Center(
          child: SvgPicture.asset("assets/images/UICompenent2.svg"),
          
        )

      ],
    );
  }
}