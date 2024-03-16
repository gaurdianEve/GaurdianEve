import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaurdianeve/Authentication/bloc/auth_b_loc_bloc.dart';
import 'package:gaurdianeve/components/customeSnackBar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../components/loginComponents.dart';
import '../components/signUpComponents.dart';
import '../constants.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  double width = 0.0;
  double height = 0.0;
  bool isLoginShowing = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    void onTap() => setState(() {
          isLoginShowing = !isLoginShowing;
        });
    void popScreen(BuildContext context) {
      try {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Perform navigation after the build phase
          if (mounted) {
            Navigator.pop(context);
          }
        });
      } catch (e) {
        print("Error while popping screen: $e");
      }
    }

    print(
        "AuthPage Build: AuthBLocBloc - ${BlocProvider.of<AuthBLocBloc>(context).state}");
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Stack(children: [
        Positioned(
            top: -height / 2,
            left: width / 2 - 372,
            child: const CircleAvatar(
              radius: 372,
              backgroundColor: circleAvatarColor,
            )),
        Positioned(
            top: -height / 2 + 200,
            left: width / 2 - 372,
            child: const CircleAvatar(
              radius: 372,
              backgroundColor: circleAvatarColor,
            )),
        BlocBuilder<AuthBLocBloc, AuthBLocState>(
          builder: (context, state) {
            if (state is Authenticated) {
              Future.delayed(const Duration(milliseconds: 1000),
                  () => {popScreen(context)});
            } else if (state is AuthenticationError) {
              Future.delayed(Duration.zero, () {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 0,
                      content: CustomeSnackBar(
                        icon: const Icon(
                          FontAwesomeIcons.x,
                          color: whiteD,
                        ),
                        text: state.message,
                      ),
                      backgroundColor: const Color(0x00FFFFFF),
                    ),
                  );
                }
              });
            }

            return Center(
              child: isLoginShowing
                  ? LoginComponent(height: height, width: width, onTap: onTap)
                  : SignUpComponent(height: height, width: width, onTap: onTap),
            );
          },
        ),
        
      ]),
    );
  }
}
