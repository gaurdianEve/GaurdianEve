import 'package:flutter/material.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'OnboardScreen1.dart';
import 'OnboardScreen2.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  

  List<Widget> _onboardingPages = [
    
   OnboardScreen2()
    
  ];
  @override
  Widget build(BuildContext context) {
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
            left: width/2-32,
            bottom: height/7,
            
            child: CircleAvatar(
            radius: 32,
            backgroundColor: teal,
            child: Icon(FontAwesomeIcons.arrowRight, color: Colors.white,)
          ))
        ],
      ),
      backgroundColor: scaffoldBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
    );
  }
}