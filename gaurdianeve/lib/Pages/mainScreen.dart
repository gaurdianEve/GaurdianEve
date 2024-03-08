import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaurdianeve/Authentication/bloc/auth_b_loc_bloc.dart';
import 'package:gaurdianeve/Pages/OnboardScreen/OnboardScreenState.dart';
import 'package:gaurdianeve/Pages/homeScreen.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../model/user.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState()  {
    // TODO: implement initState
    

    super.initState();
    FirebaseMessaging.onMessage.listen((event) {
    print("in listner");
    print(event.notification!.body);
  },);
    
    
    
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(snapshot.data!.uid)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.exists) {
                final currentUser = UserProfile(
                  snapshot.data!.get("id"),
                  snapshot.data!.get("avatarUrl"),
                  snapshot.data!.get("username"),
                  snapshot.data!.get("email"),
                );
                return HomeScreen(user: currentUser);
              } else {
                return BlocBuilder<AuthBLocBloc, AuthBLocState>(
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case Unauthenticated:
                        return const OnboardScreen();
                      case Authenticated:
                        return HomeScreen(user: (state as Authenticated).user);
                      case Loading:
                        return LoadingAnimationWidget.stretchedDots(
                          color: pink,
                          size: 100,
                        );
                      default:
                        return const Text("Something went wrong!");
                    }
                  },
                );
              }
            },
          );
        } else {
          return BlocBuilder<AuthBLocBloc, AuthBLocState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case Unauthenticated:
                  return const OnboardScreen();
                case Authenticated:
                  return HomeScreen(user: (state as Authenticated).user);
                case Loading:
                  return LoadingAnimationWidget.stretchedDots(
                    color: pink,
                    size: 100,
                  );
                default:
                  return const Text("Something went wrong!");
              }
            },
          );
        }
      },
    );
  }
}
