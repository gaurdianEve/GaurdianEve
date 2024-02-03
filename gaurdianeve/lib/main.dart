import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gaurdianeve/Authentication/bloc/auth_b_loc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaurdianeve/Pages/mainScreen.dart';
import 'OnboardScreen/OnboardScreenState.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( BlocProvider(
    create: (context) => AuthBLocBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
