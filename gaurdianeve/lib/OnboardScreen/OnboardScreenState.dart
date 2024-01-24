import 'package:flutter/material.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'OnboardScreen1.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
   double width = MediaQuery.of(context).size.width;
   double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          OnboardScreen1(),
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