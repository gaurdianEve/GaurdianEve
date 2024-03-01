import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class FriendMessageContainer extends StatelessWidget {
  const FriendMessageContainer({super.key, required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16.sp,
            child: Image.asset("assets/images/person1.png"),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            username,
            style: GoogleFonts.poppins(color: blackD, fontSize: 16.sp),
          ),
          Spacer(),
          const Icon(Icons.more_vert)
        ],
      ),
    );
  }
}
