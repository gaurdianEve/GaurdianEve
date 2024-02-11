import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mappls_gl/mappls_gl.dart';
import 'package:location/location.dart';

import '../constants.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapplsMapController? mapController;
  Location _locationController = Location();
  // double lat = 28.6445;
  // double longi = 77.2326;
  LatLng initialLocation = LatLng(28.6445, 77.2326);

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
    getLocationUpdate();

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
          top: 6,
          left: 0,
          right: 0,
          child: Container(
            height: (height / 3.5) * aspectRatio,
            width: width,
            padding: const EdgeInsets.all(18),
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
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
                      color: grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 150, bottom: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(26),
            ),
            child: MapplsMap(
              onMapCreated: (controller) {
                mapController = controller;

                
              },
              initialCameraPosition: CameraPosition(
                target: initialLocation, // Delhi coordinates
                zoom: 14.0,
              ),
              myLocationEnabled: true,              
              myLocationRenderMode: MyLocationRenderMode.NORMAL,
             
              
            ),
          ),
        ),
      ],
    );
  }

  Future<void> getLocationUpdate() async {
    bool _serviceEnable;
    PermissionStatus _permissionGranted;
    _serviceEnable = await _locationController.serviceEnabled();
    if (_serviceEnable) {
      _serviceEnable = await _locationController.requestService();
    } else {
      return;
    }
    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationController.onLocationChanged.listen((location) {
      if (location.latitude!=null && location.longitude!=null) {
        setState(() {
          mapController?.clearSymbols();
          initialLocation = LatLng(location.latitude!, location.longitude!);
          mapController?.animateCamera(CameraUpdate.newLatLng(initialLocation));
          addMarker();
        });
      }
      
    });
  }

  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController?.addImage(name, list,);
  }
 

  void addMarker() async {
    await addImageFromAsset("icon", "assets/images/person1.png");
    mapController?.addSymbol(
        SymbolOptions(geometry: initialLocation, zIndex: 0));
  }
  @override
  void dispose() {
    // TODO: implement dispose

   
    
    super.dispose();
    
   

  }
}
