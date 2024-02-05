import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaurdianeve/Authentication/AuthPage.dart';
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
          PageView.builder(
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
          Positioned(
            left: width / 2 - 32,
            bottom: height / 7,
            child: GestureDetector(
              onTap: () {
                print(height);
                if (_currentPage == _onboardingPages.length - 1) {
                   Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AuthPage()),
            );
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInToLinear,
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
          TextButton(
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
        ],
      ),
      backgroundColor: scaffoldBackgroundColor,
    );
  }

}
