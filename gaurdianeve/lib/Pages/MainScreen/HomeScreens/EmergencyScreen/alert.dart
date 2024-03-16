import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../components/customeSnackBar.dart';

class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  double screenWidth = 0;
  bool startAnimation = false;

  List<String> helpLineNumbers = [
    "191",
    "1091",
    "1090",
    "1098",
    "1422",
  ];

  List<String> helpLineNames = [
    "Women Helpline",
    "Domestic Abuse",
    "Stalking & Phone Abuse",
    "Child Helpline",
    "Tourist Police",
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: ListView(
        children: [
          Center(
            child: Text(
              "Emergency Helpline",
              style: GoogleFonts.poppins(
                  color: pink, fontSize: 22.sp, fontWeight: FontWeight.w200),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ...List.generate(
            helpLineNumbers.length,
            (index) => AnimatedContainer(
              duration: Duration(milliseconds: 300 + (index * 200)),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(
                  startAnimation ? 0 : screenWidth, 0, 0),
              child: EmergencyNumber(
                helpLineNumber: helpLineNumbers[index],
                helpLinename: helpLineNames[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmergencyNumber extends StatelessWidget {
  const EmergencyNumber(
      {super.key, required this.helpLinename, required this.helpLineNumber});
  final String helpLinename;
  final String helpLineNumber;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      height: height / 7,
      width: width,
      decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(helpLinename,
                  style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w200,
                      color: teal)),
              Text(helpLineNumber,
                  style: GoogleFonts.poppins(
                      fontSize: 24.sp, fontWeight: FontWeight.w300)),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: helpLineNumber));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  margin: null,
                  content: CustomeSnackBar(
                    text: "Successfully Copied!",
                    icon: Icon(
                      FontAwesomeIcons.check,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Color(0x00FFFFFF),
                  elevation: 0,
                ),
              );
            },
            child: const CircleAvatar(
              backgroundColor: scaffoldBackgroundColor,
              child: Icon(
                Icons.copy,
                color: pink,
              ),
            ),
          )
        ],
      ),
    );
  }
}
