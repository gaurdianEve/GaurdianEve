import 'package:flutter/material.dart';
import 'package:gaurdianeve/model/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});
  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(user.email),
      ),
    );
  }
}
