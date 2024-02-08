import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mappls_gl/mappls_gl.dart';

import '../constants.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MapplsAccountManager.setMapSDKKey("c12cb8813de956f7d190e11764dbe137");
    MapplsAccountManager.setRestAPIKey("c12cb8813de956f7d190e11764dbe137");
    MapplsAccountManager.setAtlasClientId(
        "96dHZVzsAuvVj-nXAOwtjMFRihW7oT1iJ4VqMi3Ot4ytqtPiepg1zYx5t0SatLXFlqQr_HPlr5RJo4gnR93OKxDSOueXsUQn");
    MapplsAccountManager.setAtlasClientSecret(
        "lrFxI-iSEg82z_cr0iWw5RioEeZNLCAsd5WGzVwRv_f6iJ3rrYq1n6C_AiQAw6wi1Ad7wzNYChs7c6u1G_36AyBRQQboTEVkC4MYPnNQ1vk=");
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    const ScreenUtilInit();
    return Stack(
      children: [
        Positioned(
          top:0,
          left: -10,
          child: Container(
            height:(height/3.5)*aspectRatio,
            width: width,
            padding: const EdgeInsets.all(12),
            margin: EdgeInsets.only(left: 30, right: 30, ),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Red",
                        style: GoogleFonts.getFont(
                          "Montserrat",
                          color: pink,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                      TextSpan(
                        text: "Zones",
                        style: GoogleFonts.caveat(
                            color: grey,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Share the RedZone location with you ",
                  style: GoogleFonts.poppins(
                      color: grey, fontSize: 12.sp, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 30, right: 30, top: 150, bottom: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(26)),
            child: Expanded(
              child: MapplsMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(28.6445, 77.2326), // Delhi coordinates
                  zoom: 14.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
