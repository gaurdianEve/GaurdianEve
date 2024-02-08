import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class CallNotification extends StatelessWidget {
  const CallNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 22,vertical: 16),
       decoration: const  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child:Column(
        children: [
          Row(
            
            children: [
              CircleAvatar(
                radius: 32,
                child: Image.asset("assets/images/person1.png"),
              ),
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("MOM",style: GoogleFonts.poppins(fontSize: 18.sp),),
                  Text("809808980",style: GoogleFonts.poppins(),),
                ],
              ),
              const Spacer(),
              
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                  children: [
                    const Icon(FontAwesomeIcons.phoneSlash,color: Colors.white,size: 16,),
                    Text("Decline",style: GoogleFonts.poppins(fontSize: 12.sp,color: Colors.white),),
                  ],
                              ),
                ),),),
                
                Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                  children: [
                    const Icon(FontAwesomeIcons.phone,color: Colors.white,),
                    Text("Answer",style: GoogleFonts.poppins(fontSize: 12.sp,color: Colors.white),),
                  ],
                              ),
                ),),)
            ],
          )
        ],
      ) ,
    );
  }
}