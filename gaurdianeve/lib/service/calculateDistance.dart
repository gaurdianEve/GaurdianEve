import 'dart:math';

import 'package:mappls_gl/mappls_gl.dart';

double calculateDistance(LatLng userLocation, LatLng redZone) {
  const double earthRadius = 6371.0; // in kilometers

  double lat1 = userLocation.latitude * pi / 180.0;
  double lon1 = userLocation.longitude * pi / 180.0;
  double lat2 = redZone.latitude * pi / 180.0;
  double lon2 = redZone.longitude * pi / 180.0;

  double dLat = lat2 - lat1;
  double dLon = lon2 - lon1;

  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return earthRadius * c;
}