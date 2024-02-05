import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaurdianeve/Pages/setting.dart';
import 'package:gaurdianeve/model/user.dart';
import '../components/appname.dart';
import '../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});
  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    const ScreenUtilInit();
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const AppName(),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SvgPicture.asset("assets/images/notification.svg"),
          ),
          const SizedBox(
            width: 37,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Setting()),
              );
            },
            child: CircleAvatar(
              child: Image.asset("assets/images/person1.png"),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Center(
        child: Text(user.email),
      ),
    );
  }
}
