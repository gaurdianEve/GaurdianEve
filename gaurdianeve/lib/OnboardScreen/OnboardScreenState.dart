import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            duration: Duration(milliseconds: 420),
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
                  Future.delayed(
                    Duration(milliseconds: 800),
                    (){
                      customDialogBox(context,onChange:(value) => setState(() {
                        isAuthenticationDialogShow = false;
                      }),);
                    }
                    
                  );
                  
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
            duration: Duration(milliseconds: 240),
            right: width / 12,
            top: isAuthenticationDialogShow ? -50 : height / 12,
            child: TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(6)),
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

  Future<Object?> customDialogBox(BuildContext context,{required ValueChanged onChange}) {
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
    print(width);
    return showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: "Sign In",
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return Center(
                      child: Stack(
                        children: [
                          Container(
                        
                        height:height/1.832 ,
                        width:width/1.256,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))

                        ),
                        

                      )
                        ],
                      ),
                    );
                  },
                ).then(onChange);
  }
}
