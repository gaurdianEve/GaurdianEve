import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaurdianeve/Authentication/bloc/auth_b_loc_bloc.dart';
import 'package:gaurdianeve/OnboardScreen/OnboardScreenState.dart';
import 'package:gaurdianeve/Pages/homeScreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBLocBloc, AuthBLocState>(
      
      builder: (context, state) {
        switch (state.runtimeType) {
          case Unauthenticated:{
            return const OnboardScreen();

          }
          case Authenticated:{
            return HomeScreen(user: (state as Authenticated).user );

          }
          case Loading:{
            return CircularProgressIndicator();
          }
            

          default:{
            return Text("Some thing wrong!");
          }
        }
      },
    );
  }
}
