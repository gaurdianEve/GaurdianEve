import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class AvatarSelectionScreen extends StatefulWidget {
  const AvatarSelectionScreen({Key? key}) : super(key: key);

  @override
  _AvatarSelectionScreenState createState() => _AvatarSelectionScreenState();
}

class _AvatarSelectionScreenState extends State<AvatarSelectionScreen> {
  String _selectedAvatarPath = "assets/images/avatars/avatar1.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00FFFFFF),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            FontAwesomeIcons.chevronLeft,
            color: grey,
          ),
        ),
        title: Text(
          "Create Your Avatar",
          style: GoogleFonts.poppins(fontSize: 22.sp, color: grey),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          ClipOval(
            child: Image.asset(
              _selectedAvatarPath,
              height: 150,
              width: 150,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            color: grey,
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            children: [
              _buildAvatar("assets/images/avatars/avatar1.png"),
              _buildAvatar("assets/images/avatars/avatar2.png"),
              _buildAvatar("assets/images/avatars/avatar3.png"),
              _buildAvatar("assets/images/avatars/avatar4.png"),
              _buildAvatar("assets/images/avatars/avatar5.png"),
              _buildAvatar("assets/images/avatars/avatar6.png"),
              _buildAvatar("assets/images/avatars/avatar7.png"),
              _buildAvatar("assets/images/avatars/avatar8.png"),
              _buildAvatar("assets/images/avatars/avatar9.png"),
              _buildAvatar("assets/images/avatars/avatar10.png"),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: pink,
        child: const Icon(FontAwesomeIcons.check,color: whiteD,),
      ),
    );
  }

  Widget _buildAvatar(String path) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAvatarPath = path;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: path == _selectedAvatarPath ? pink : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipOval(
              child: Image.asset(
                path,
                height: height / 6.5 * aspectRatio,
                width: width / 3 * aspectRatio,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
