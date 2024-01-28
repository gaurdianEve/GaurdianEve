import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'OnboardScreen1.dart';
import 'OnboardScreen2.dart';
import 'OnboardScreen3.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool isAuthenticationDialogShow = false;

  final List<Widget> _onboardingPages = [
    const OnboardScreen1(),
    const OnboardScreen2(),
    const OnboardScreen3()
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            top: isAuthenticationDialogShow ? -height : 0,
            height: height,
            width: width,
            duration: const Duration(milliseconds: 420),
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardingPages.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return _onboardingPages[index];
              },
            ),
          ),
          Positioned(
            left: width / 2 - 32,
            bottom: height / 7,
            child: GestureDetector(
              onTap: () {
                print(height);
                if (_currentPage == _onboardingPages.length - 1) {
                  setState(() {
                    isAuthenticationDialogShow = true;
                  });
                  Future.delayed(const Duration(milliseconds: 600), () {
                    customDialogBox(
                      context,
                      onChange: (value) => setState(() {
                        isAuthenticationDialogShow = false;
                      }),
                    );
                  });
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInCubic,
                  );
                }
              },
              child: const CircleAvatar(
                  radius: 32,
                  backgroundColor: teal,
                  child: Icon(
                    FontAwesomeIcons.arrowRight,
                    color: Colors.white,
                  )),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 240),
            right: width / 12,
            top: isAuthenticationDialogShow ? -50 : height / 12,
            child: TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(6)),
                    backgroundColor: MaterialStateProperty.all(grey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ))),
                onPressed: () {
                  setState(() {
                    _pageController.jumpTo(
                        width * (_onboardingPages.length - _currentPage));
                  });
                },
                child: Text("Skip",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1,
                        fontSize: 16.sp))),
          ),
        ],
      ),
      backgroundColor: scaffoldBackgroundColor,
    );
  }

  Future<Object?> customDialogBox(BuildContext context,
      {required ValueChanged onChange}) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(width);
    bool isLoginShowing = false;
    return showGeneralDialog(
      context: context,
      transitionBuilder:(context, animation, secondaryAnimation, child) {
        Tween<Offset> tween;
        tween = Tween(begin: Offset(0,-1),end: Offset.zero);
        return SlideTransition(position: tween.animate(CurvedAnimation(parent: animation, curve:Curves.fastEaseInToSlowEaseOut)),child: child,);

      },
      transitionDuration: Duration(milliseconds: 400),
      barrierDismissible: true,
      barrierLabel: "Sign In",
      pageBuilder: (_, animation, __) {
        return Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              isLoginShowing? LoginComponent(height: height, width: width):SignUpComponent(height: height, width: width,onTap: ()=>isLoginShowing=true),
              Positioned(
                top: height / 2 + 16,
                left: (width / 1.2) / 2 - 30,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    FontAwesomeIcons.x,
                    color: Colors.black,
                    size: 14,
                  ),
                ),
              )
            ],
          ),
        );
      },
    ).then(onChange);
  }
}

class SignUpComponent extends StatelessWidget {
  const SignUpComponent({
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
                  "Sign Up",
                  style: GoogleFonts.poppins(fontSize: 24.sp),
                ),
                const SizedBox(height: 25,),
                TextFormField(
                  enabled: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                    constraints: const BoxConstraints(
                      minHeight: 45,
                      maxHeight: 45,
                      maxWidth: 292,
                      minWidth: 292
                    ),
                      hintText: 'username',
                      hintStyle: GoogleFonts.poppins( fontWeight: FontWeight.w300, color: Colors.black,letterSpacing: 1,fontSize: 12.sp,textBaseline: TextBaseline.alphabetic),
                      filled: true,
                      fillColor: const Color(0xFFF7F7F7),
                      enabled: true,
                      
                      suffixIcon:  Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset("assets/images/user.svg"),
                      ),
                      //suffixIcon: Icon(FontAwesomeIcons.user,color: Colors.black,size: 16,),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.circular(13)))),
                ),
                const SizedBox(height: 22,),
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
                const SizedBox(height: 22,),
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
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: pink,
                       borderRadius:
                                BorderRadius.all(Radius.circular(12))
                                  
                    ),
                    child: Center(child: Text("Login", style: GoogleFonts.poppins(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w400),)),
                  ),
                ),
                SizedBox(height: 5,),
                GestureDetector(
                  onTap:(){
                    onTap;
                    print("in login");
                  },
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

class LoginComponent extends StatelessWidget {
  const LoginComponent({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

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
                  enabled: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                    constraints: const BoxConstraints(
                      minHeight: 45,
                      maxHeight: 45,
                      maxWidth: 292,
                      minWidth: 292
                    ),
                      hintText: 'username',
                      hintStyle: GoogleFonts.poppins( fontWeight: FontWeight.w300, color: Colors.black,letterSpacing: 1,fontSize: 12.sp,textBaseline: TextBaseline.alphabetic),
                      filled: true,
                      fillColor: const Color(0xFFF7F7F7),
                      enabled: true,
                      
                      suffixIcon:  Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset("assets/images/user.svg"),
                      ),
                      //suffixIcon: Icon(FontAwesomeIcons.user,color: Colors.black,size: 16,),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.circular(13)))),
                ),
                const SizedBox(height: 22,),
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
                const SizedBox(height: 22,),
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
                  child: Center(child: Text("Login", style: GoogleFonts.poppins(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w400),)),
                ),
                SizedBox(height: 5,),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
        children: [
          TextSpan(text: "Already have Account",style: GoogleFonts.getFont("Poppins",color: Colors.black,fontWeight:FontWeight.w200,fontSize: 12.sp,letterSpacing: 0.5)),
          TextSpan(text: " Log in",style: GoogleFonts.poppins(color: teal,fontSize: 12.sp,fontWeight: FontWeight.w200)),
        ]
      )),
              ]),
        ),
      ),
    );
  }
}
