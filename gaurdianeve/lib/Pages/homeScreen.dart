import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaurdianeve/Pages/alert.dart';
import 'package:gaurdianeve/Pages/fakecall.dart';
import 'package:gaurdianeve/Pages/mapScreen.dart';
import 'package:gaurdianeve/Pages/messages.dart';
import 'package:gaurdianeve/Pages/setting.dart';
import 'package:gaurdianeve/model/user.dart';
import '../components/appname.dart';
import '../components/bottomnavigationTile.dart';
import '../constants.dart';
import 'fallCallAddScreen.dart';
import 'notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  final UserProfile user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 1;
  
  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
    const MapScreen(),
    const FakeCall(),
    const Emergency(),
    const Messages(),
    Setting(user: widget.user)
  ];
    return Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const AppName(),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NoficationScreen()),
                  );
                },
                child: SvgPicture.asset("assets/images/notification.svg"),
              ),
            ),
            const SizedBox(width: 37),
            CircleAvatar(
              child: ClipOval(child: Image.asset("assets/images/avatars/${widget.user.avatarURL}.png")),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: _pages[_currentPageIndex],
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomNavigationTile(
                  selectedSvgPath: "assets/images/location1.svg",
                  svgPath: "assets/images/location.svg",
                  isSelected: _currentPageIndex == 0,
                  onTap: () => setState(() => _currentPageIndex = 0),
                ),
                BottomNavigationTile(
                  selectedSvgPath: "assets/images/fakecall1.svg",
                  svgPath: "assets/images/fakecall.svg",
                  isSelected: _currentPageIndex == 1,
                  onTap: () => setState(() => _currentPageIndex = 1),
                ),
                BottomNavigationTile(
                  selectedSvgPath: "assets/images/alert.svg",
                  svgPath: "assets/images/alert1.svg",
                  isSelected: _currentPageIndex == 2,
                  onTap: () => setState(() => _currentPageIndex = 2),
                ),
                BottomNavigationTile(
                  selectedSvgPath: "assets/images/friend1.svg",
                  svgPath: "assets/images/friend.svg",
                  isSelected: _currentPageIndex == 3,
                  onTap: () => setState(() => _currentPageIndex = 3),
                ),
                BottomNavigationTile(
                  selectedSvgPath: "assets/images/setting.svg",
                  svgPath: "assets/images/setting1.svg",
                  isSelected: _currentPageIndex == 4,
                  onTap: () => setState(() => _currentPageIndex = 4),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: IndexedStack(
          index: _currentPageIndex==1?0:1,
          children: [
            FloatingActionButton(
                backgroundColor: teal,
                onPressed: () {
                 Navigator.push(context,MaterialPageRoute(builder:(context) {
                  return  const FakeCallAddScreen();
                 }, ));
                },
                child: Icon(
                  FontAwesomeIcons.plus,
                  color: Color(0xFFFFFFFF),
                )),
                SizedBox(width: 0,height: 0,),
          ],
        ));
  }
}
