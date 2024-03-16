import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaurdianeve/service/emailVerification.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Authentication/bloc/auth_b_loc_bloc.dart';
import '../constants.dart';

class SignUpComponent extends StatefulWidget {
  SignUpComponent(
      {super.key,
      required this.height,
      required this.width,
      required this.onTap});

  final double height;
  final double width;
  final void Function()? onTap;

  @override
  State<SignUpComponent> createState() => _SignUpComponentState();
}

class _SignUpComponentState extends State<SignUpComponent> {
  TextEditingController emailController = TextEditingController();

  TextEditingController userController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isSeen = true;

  void toogleIsSeen() {
    setState(() {
      isSeen = !isSeen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height / 1.832,
      width: widget.width / 1.256,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Sign Up",
              style: GoogleFonts.poppins(fontSize: 24.sp),
            ),
            const SizedBox(
              height: 25,
            ),
            TextField(
              enabled: true,
              controller: userController,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  constraints: const BoxConstraints(
                      minHeight: 45,
                      maxHeight: 45,
                      maxWidth: 292,
                      minWidth: 292),
                  hintText: 'username',
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 1,
                      fontSize: 12.sp,
                      textBaseline: TextBaseline.alphabetic),
                  filled: true,
                  fillColor: const Color(0xFFF7F7F7),
                  enabled: true,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset("assets/images/user.svg"),
                  ),
                  //suffixIcon: Icon(FontAwesomeIcons.user,color: Colors.black,size: 16,),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(13)))),
            ),
            const SizedBox(
              height: 22,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  constraints: const BoxConstraints(
                      minHeight: 45,
                      maxHeight: 45,
                      maxWidth: 292,
                      minWidth: 292),
                  hintText: 'email',
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 1,
                      fontSize: 12.sp),
                  filled: true,
                  fillColor: const Color(0xFFF7F7F7),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset("assets/images/email.svg"),
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(13)))),
            ),
            const SizedBox(
              height: 22,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  constraints: const BoxConstraints(
                      minHeight: 45,
                      maxHeight: 45,
                      maxWidth: 292,
                      minWidth: 292),
                  hintText: 'password',
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 1,
                      fontSize: 12.sp),
                  filled: true,
                  fillColor: const Color(0xFFF7F7F7),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: isSeen
                        ? GestureDetector(
                            onTap: () {
                              toogleIsSeen();
                            },
                            child:
                                SvgPicture.asset("assets/images/password.svg"))
                        : GestureDetector(
                            onTap: () {
                              toogleIsSeen();
                            },
                            child: SvgPicture.asset(
                                "assets/images/password_not_seen.svg")),
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(13)))),
            ),
            const SizedBox(
              height: 27,
            ),
            GestureDetector(
              onTap: () {
                print(emailController.text);
                if (passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Password field is empty !'),
                  ));
                }
                if (userController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('User field is empty !'),
                  ));
                }
                if (emailController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Email field is empty !'),
                  ));
                }
                if (validateEmail(emailController.text)) {
                  BlocProvider.of<AuthBLocBloc>(context).add(
                    CreateUser(
                      username: userController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Enter valid Email !'),
                  ));
                }
              },
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: pink,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Center(
                  child: BlocBuilder<AuthBLocBloc, AuthBLocState>(
                    builder: (context, state) {
                      if (state is Loading) {
                        return LoadingAnimationWidget.stretchedDots(
                            color: whiteD, size: 50);
                      } else {
                        return Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: widget.onTap,
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Already have Account",
                        style: GoogleFonts.getFont("Poppins",
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                            fontSize: 12.sp,
                            letterSpacing: 0.5)),
                    TextSpan(
                        text: " Log in",
                        style: GoogleFonts.poppins(
                            color: teal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w200)),
                  ])),
            ),
          ]),
        ),
      ),
    );
  }
}
