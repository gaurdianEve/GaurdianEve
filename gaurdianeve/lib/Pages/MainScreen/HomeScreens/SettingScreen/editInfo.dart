import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaurdianeve/Authentication/bloc/auth_b_loc_bloc.dart';

import 'package:gaurdianeve/Pages/MainScreen/HomeScreens/SettingScreen/avatarSelectionScreen.dart';
import 'package:gaurdianeve/components/customeSnackBar.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:gaurdianeve/main.dart';
import 'package:gaurdianeve/model/user.dart';
import 'package:google_fonts/google_fonts.dart';

class EditInfo extends StatefulWidget {
  EditInfo({super.key, required this.user});
  final UserProfile user;
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._username = TextEditingController(text: widget.user.username);

    widget._email = TextEditingController(text: widget.user.email);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;

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
                      return  AvatarSelectionScreen(url: widget.user.avatarURL,);
                    },
                  ));
                },
                child: Stack(children: [
                  ClipOval(
                      child: Image.asset("assets/images/avatars/${widget.user.avatarURL}.png")),
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
              controller: widget._username,
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
              controller: widget._email,
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
                  Text(widget.user.id),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: widget.user.id));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
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
        onPressed: () {
          BlocProvider.of<AuthBLocBloc>(context).add(UpdatingUser(UserProfile(
              widget.user.id,
              widget.user.avatarURL,
              widget._username.text,
              widget._email.text)));
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: CustomeSnackBar(
              text: "Updated Info",
              icon: Icon(
                FontAwesomeIcons.check,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ));
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MyApp()),
          );
        },
        backgroundColor: teal,
        child: const Icon(FontAwesomeIcons.check),
      ),
    );
  }
}
