import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaurdianeve/Pages/avatarSelectionScreen.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:gaurdianeve/model/user.dart';
import 'package:google_fonts/google_fonts.dart';

class EditInfo extends StatelessWidget {
  const EditInfo({super.key, required this.user});
  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    TextEditingController _username =
        TextEditingController(text: user.username);
    TextEditingController _email = TextEditingController(text: user.email);

    ScreenUtil();
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            FontAwesomeIcons.chevronLeft,
            color: teal,
            size: 28,
          ),
        ),
        backgroundColor: const Color(0x00FFFFFF),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Edit Info",
          style: GoogleFonts.redHatDisplay(color: teal, fontSize: 22.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 8,
            ),
            Center(
                child: Text(
              "Change Avatar",
              style: GoogleFonts.redHatDisplay(color: teal, fontSize: 22.sp),
            )),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: CircleAvatar(
              radius: 50,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const AvatarSelectionScreen();
                    },
                  ));
                },
                child: Stack(children: [
                  ClipOval(
                      child: Image.asset("assets/images/avatars/avatar10.png")),
                  const Positioned(
                      bottom: 1,
                      right: 1,
                      child: CircleAvatar(
                        backgroundColor: pink,
                        radius: 16,
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: Icon(
                            FontAwesomeIcons.penToSquare,
                            size: 12,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      )),
                ]),
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            Text(
              "usename",
              style: GoogleFonts.poppins(fontSize: 12.sp),
            ),
            TextField(
              controller: _username,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  constraints: const BoxConstraints(
                      minHeight: 50, maxHeight: 50, maxWidth: double.infinity),
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 1,
                      fontSize: 12.sp),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(13)))),
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              "Email",
              style: GoogleFonts.poppins(fontSize: 12.sp),
            ),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  constraints: const BoxConstraints(
                      minHeight: 50,
                      maxHeight: 50,
                      maxWidth: double.infinity,
                      minWidth: double.infinity),
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 1,
                      fontSize: 12.sp),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(13)))),
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              "userid",
              style: GoogleFonts.poppins(fontSize: 16.sp, color: grey),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Row(
                children: [
                  Text(user.id),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: user.id));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Id copied'),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundColor: teal,
                      radius: 22,
                      child: Icon(
                        FontAwesomeIcons.copy,
                        color: whiteD,
                        size: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Spacer()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: teal,
        child: const Icon(FontAwesomeIcons.check),
      ),
    );
  }
}

void _copyToClipboard(String text) {}
