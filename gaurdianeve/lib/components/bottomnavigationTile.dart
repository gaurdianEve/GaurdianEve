import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class BottomNavigationTile extends StatelessWidget {
  const BottomNavigationTile({
    super.key,  required this.isSelected, required this.selectedSvgPath, required this.svgPath,
  });
  final String selectedSvgPath;
  final String svgPath;
  final bool isSelected;
  //"assets/images/fakecall.svg"

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:  BoxDecoration(
        color: isSelected? pink :Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(16))
      ),
      child: isSelected? SvgPicture.asset(selectedSvgPath): SvgPicture.asset(svgPath));
  }
}
