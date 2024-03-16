import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class Feed extends StatefulWidget {
  Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  String _selectedAvatarPath = "assets/images/emoji/lovely.png";
  late RiveAnimationController _controller;

  Artboard? _riveArtboard;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil();
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          " FeedBack",
          style: TextStyle(fontSize: 30, color: blackD),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Please tell us about your experience about GaurdianEve",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  _buildEmoji("assets/images/emoji/sad.png"),
                  _buildEmoji("assets/images/emoji/grimacing-face.png"),
                  _buildEmoji("assets/images/emoji/neutral-face.png"),
                  _buildEmoji("assets/images/emoji/face-with-tongue.png"),
                  _buildEmoji("assets/images/emoji/lovely.png"),
                ],
              ),
              TextField(
                cursorColor: pink,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF7F7F7),
                    enabled: true,
                    
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: pink,width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(14))
                       
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: pink,width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(14))
                       
                    ),

                )
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder:(context) {
                  //   return WidgetClassName();

                  // },));
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                    color: teal,
                  ),
                  child: Text(
                    "SUBMIT",
                    style: GoogleFonts.poppins(fontSize: 16.sp, color: whiteD),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmoji(String path) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAvatarPath = path;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: path == _selectedAvatarPath ? pink : Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipOval(
              child: Image.asset(
                path,
                height: height / 9 * aspectRatio,
                width: width / 5 * aspectRatio,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
