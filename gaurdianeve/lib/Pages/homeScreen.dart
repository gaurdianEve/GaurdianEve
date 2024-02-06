import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaurdianeve/Pages/setting.dart';
import 'package:gaurdianeve/model/user.dart';
import '../components/appname.dart';
import '../components/bottomnavigationTile.dart';
import '../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});
  final UserProfile user;
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
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
      bottomNavigationBar: SafeArea(child:
      Container(
        height: (height/8)*aspectRatio,
        padding: const  EdgeInsets.symmetric(horizontal: 28,vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 32),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavigationTile(selectedSvgPath: "assets/images/selectedTile/fakecall.svg", svgPath: "assets/images/location.svg", isSelected: false,),
            BottomNavigationTile(selectedSvgPath: "assets/images/selectedTile/location1.svg", svgPath: "assets/images/fakecall.svg", isSelected: true,),
            BottomNavigationTile(selectedSvgPath: "assets/images/selectedTile/alert1.svg", svgPath: "assets/images/alert.svg", isSelected: true,),
            BottomNavigationTile(selectedSvgPath: "assets/images/selectedTile/friend1.svg", svgPath: "assets/images/friend.svg", isSelected: false,),
            BottomNavigationTile(selectedSvgPath: "assets/images/selectedTile/message1.svg", svgPath: "assets/images/message.svg", isSelected: true,),
            

            
          ],
        ),
      )
       ),
    );
  }
}

