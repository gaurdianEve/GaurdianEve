import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaurdianeve/Authentication/bloc/auth_b_loc_bloc.dart';
import 'package:gaurdianeve/Pages/mainScreen.dart';

import 'FakeCall/bloc/fake_call_bloc.dart';
import 'Invitation/bloc/inivite_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
        )
      ],
      debug: true);
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<AuthBLocBloc>(
          create: (context) => AuthBLocBloc(),
        ),
        BlocProvider<IniviteBloc>(
          create: (context) => IniviteBloc(),
        ),
        BlocProvider(
          create: (context) => FakeCallBloc(),
          child: Container(),
        )
        // Add more BlocProviders as needed
      ],
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
