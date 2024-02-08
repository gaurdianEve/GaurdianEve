import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaurdianeve/Pages/fakecall.dart';
import 'package:gaurdianeve/Pages/mapScreen.dart';
import 'package:gaurdianeve/Pages/setting.dart';
import 'package:gaurdianeve/model/user.dart';
import '../components/appname.dart';
import '../components/bottomnavigationTile.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key, required this.user});
  final UserProfile user;
  int _currentPageIndex = 1;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    List<Widget> _pages  = [

      const MapScreen(),
      const FakeCall(),
      const Center(child: Text("alert")),
      const Center(child: Text("friends")),
      const Center(child: Text("messages")),
  


    ];
   
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
      body:_pages[widget._currentPageIndex],
      bottomNavigationBar: SafeArea(
          child: Container(
        height: (height / 7.5) * aspectRatio,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  widget._currentPageIndex = 0;
                });
                print(widget._currentPageIndex);              },
              child: BottomNavigationTile(
                selectedSvgPath: "assets/images/location1.svg",
                svgPath: "assets/images/location.svg",
                isSelected: true,
              ),
            ),
            GestureDetector(
              onTap: (){
                 setState(() {
                  widget._currentPageIndex = 1;
                });
                print(widget._currentPageIndex);  
              },
              child: BottomNavigationTile(
                selectedSvgPath: "assets/images/fakecall1.svg",
                svgPath: "assets/images/fakecall.svg",
                isSelected: false,
              ),
            ),
            GestureDetector(
              onTap: (){
                 setState(() {
                  widget._currentPageIndex = 2;
                });
                print(widget._currentPageIndex);  
              },
              child: BottomNavigationTile(
                selectedSvgPath: "assets/images/alert.svg",
                svgPath: "assets/images/alert1.svg",
                isSelected: false,
              ),
            ),
            GestureDetector(
              onTap: (){
                 setState(() {
                  widget._currentPageIndex = 3;
                });
                print(widget._currentPageIndex);  
              },
              child: BottomNavigationTile(
                selectedSvgPath: "assets/images/friend1.svg",
                svgPath: "assets/images/friend.svg",
                isSelected: false,
              ),
            ),
            GestureDetector(
              onTap: (){
                 setState(() {
                  widget._currentPageIndex = 4;
                });
                print(widget._currentPageIndex);  
              },
              child: BottomNavigationTile(
                selectedSvgPath: "assets/images/message1.svg",
                svgPath: "assets/images/message.svg",
                isSelected: false,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
