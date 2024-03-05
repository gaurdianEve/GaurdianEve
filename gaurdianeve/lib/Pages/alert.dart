import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:google_fonts/google_fonts.dart';




class Emergency extends StatelessWidget {
  const Emergency({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return   Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: ListView(
            
            children: [ 
              Center(child: Text("Emergency Helpline",style: GoogleFonts.poppins(color: pink,fontSize: 22.sp, fontWeight:FontWeight.w200),)),
              const SizedBox(height: 12,),
              const EmergencyNumber(helpLineNumber: "191",helpLinename: "Women Helpline",),
              const SizedBox(height: 12,),
              const EmergencyNumber(helpLineNumber: "1091",helpLinename: "Domestic Abuse",),
              const SizedBox(height: 12,),
              const EmergencyNumber(helpLineNumber: "1090",helpLinename: "Stalking & Phone Abuse",),
              const SizedBox(height: 12,),
              const EmergencyNumber(helpLineNumber: "1098",helpLinename: "Child Helpline",),
              const SizedBox(height: 12,),
              const EmergencyNumber(helpLineNumber: "1422",helpLinename: "Tourist Police",),
            ]),
        );
  
  }
}

class EmergencyNumber extends StatelessWidget {
  const EmergencyNumber({super.key,required this.helpLinename, required this.helpLineNumber});
  final  String helpLinename;
  final String helpLineNumber;
  

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return Container(
      padding: const EdgeInsets.all(16),
      height: height/7,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius:BorderRadius.all(Radius.circular(30))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(helpLinename,
                  style:  GoogleFonts.poppins(fontSize: 18.sp, fontWeight:FontWeight.w200, color: teal)),
              Text(helpLineNumber,style:  GoogleFonts.poppins(fontSize: 24.sp,fontWeight:FontWeight.w300 )),
            ],
          ),
          const Spacer(),
          const CircleAvatar(
            backgroundColor: scaffoldBackgroundColor,
            child: Icon(Icons.copy,color: pink,),
          )
        ],
      ),
    );
  }
}