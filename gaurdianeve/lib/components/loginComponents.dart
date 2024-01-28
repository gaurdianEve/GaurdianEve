

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class LoginComponent extends StatelessWidget {
  const LoginComponent({
    super.key,
    required this.height,
    required this.width,
     required this.onTap
  });

  final double height;
  final double width;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 1.832,
      width: width / 1.256,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
                Text(
                  "Sign In",
                  style: GoogleFonts.poppins(fontSize: 24.sp),
                ),
                const SizedBox(height: 25,),
                
                
                TextFormField(
                  decoration: InputDecoration(
                     contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                    constraints: const BoxConstraints(
                      minHeight: 45,
                      maxHeight: 45,
                      maxWidth: 292,
                      minWidth: 292
                    ),
                      hintText: 'email',
                      hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w300, color: Colors.black,letterSpacing: 1,fontSize: 12.sp),
                      filled: true,
                      fillColor: const Color(0xFFF7F7F7),
                      suffixIcon:  Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset("assets/images/email.svg"),
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.circular(13)))),
                ),
                const SizedBox(height: 31,),
               TextFormField(
                  decoration: InputDecoration(
                     contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                    constraints: const BoxConstraints(
                      minHeight: 45,
                      maxHeight: 45,
                      maxWidth: 292,
                      minWidth: 292
                    ),
                      hintText: 'password',
                      hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w300, color: Colors.black,letterSpacing: 1,fontSize: 12.sp),
                      filled: true,
                      fillColor: const Color(0xFFF7F7F7),
                      suffixIcon:  Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset("assets/images/password.svg"),
                      ),border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.circular(13)))),
                ),
                const SizedBox(height: 27,),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: pink,
                     borderRadius:
                              BorderRadius.all(Radius.circular(12))
                                
                  ),
                  child: Center(child: Text("Sign In", style: GoogleFonts.poppins(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w400),)),
                ),
                SizedBox(height: 5,),
                GestureDetector(
                  onTap: onTap,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        children: [
                          TextSpan(text: "Already have Account",style: GoogleFonts.getFont("Poppins",color: Colors.black,fontWeight:FontWeight.w200,fontSize: 12.sp,letterSpacing: 0.5)),
                          TextSpan(text: " Log in",style: GoogleFonts.poppins(color: teal,fontSize: 12.sp,fontWeight: FontWeight.w200)),
                        ]
                      )),
                ),
              ]),
        ),
      ),
    );
  }
}
