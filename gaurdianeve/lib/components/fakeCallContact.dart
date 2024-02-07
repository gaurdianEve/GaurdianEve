import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import 'package:google_fonts/google_fonts.dart';

class FakeCallContactContainer extends StatelessWidget {
  const FakeCallContactContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.symmetric(horizontal: 18,vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 22,vertical: 16),
       decoration: const  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child:Row(
        
        children: [
          CircleAvatar(
            radius: 32,
            child: Image.asset("assets/images/person1.png"),
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("MOM",style: GoogleFonts.poppins(fontSize: 18.sp),),
              Text("809808980",style: GoogleFonts.poppins(),),
            ],
          ),
          Spacer(),
          Column(
            

            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: teal,
                child: SvgPicture.asset("assets/images/edit.svg"),

              ),
              SizedBox(height:16,),
              
              CircleAvatar(
                backgroundColor: pink,
                child: SvgPicture.asset("assets/images/phone.svg")

              ),
              
            ],
          )
        ],
      ) ,
    );
  }
}

