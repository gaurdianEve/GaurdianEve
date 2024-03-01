import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaurdianeve/Authentication/bloc/auth_b_loc_bloc.dart';
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
  bool showAnimation = false;

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
      Navigator.pop(context);
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
        AnimatedPositioned(
            top: showAnimation ? -height : -height / 2,
            curve: Curves.bounceOut,
            left: width / 2 - 372,
            duration: const Duration(milliseconds: 500),
            child: const CircleAvatar(
              radius: 372,
              backgroundColor: circleAvatarColor,
            )),
        AnimatedPositioned(
            top: showAnimation ? -height : -height / 2 + 200,
            left: width / 2 - 372,
            curve: Curves.bounceOut,
            duration: const Duration(milliseconds: 550),
            child: const CircleAvatar(
              radius: 372,
              backgroundColor: circleAvatarColor,
            )),
        BlocBuilder<AuthBLocBloc, AuthBLocState>(
          builder: (context, state) {

            if (state is Authenticated) {
              
                Future.delayed(Duration(milliseconds: 1000),()=>{
                  popScreen(context)
                });
             
            }
            return Center(
              child: isLoginShowing
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          showAnimation = !showAnimation;
                        });
                      },
                      child: LoginComponent(
                          height: height, width: width, onTap: onTap))
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          showAnimation = !showAnimation;
                        });
                      },
                      child: SignUpComponent(
                          height: height, width: width, onTap: onTap)),
            );
          },
        ),
      ]),
    );
  }
}
