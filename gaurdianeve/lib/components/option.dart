import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Option extends StatelessWidget {
  const Option({super.key, required this.asset, required this.name});
  final String asset;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
        const SizedBox(width: 10,),
        SvgPicture.asset(asset),
        const SizedBox(width: 20,),
        Text(name,style: GoogleFonts.poppins(color: grey,fontSize: 14.sp),),
        const Spacer(),
        const Icon(FontAwesomeIcons.chevronRight),
        
      ],),
    );
  }
}