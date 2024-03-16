import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaurdianeve/Authentication/bloc/auth_b_loc_bloc.dart';
import 'package:gaurdianeve/Pages/MainScreen/HomeScreens/homeScreen.dart';
import 'package:gaurdianeve/Pages/OnboardScreen/OnboardScreenState.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    BlocProvider.of<AuthBLocBloc>(context).add(CheckLogging());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBLocBloc, AuthBLocState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case Unauthenticated:
            return const OnboardScreen();
          case Authenticated:
            // Update the flag in SharedPreferences to indicate that the user is logged in
            SharedPreferences.getInstance().then((prefs) {
              prefs.setBool('isLoggedIn', true);
            });
            return HomeScreen(user: (state as Authenticated).user);
          default:
            return const Text("Something went wrong!");
        }
      },
    );
  }
}

void updateTokenInFirestore(String newToken) {
  // Update the token in Firestore for the current user
  // For example:
  FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
    'token': newToken,
  });
  // stream: FirebaseAuth.instance.authStateChanges().first.then((value) => {value.}),
}
