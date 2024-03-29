import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;
      print('-' * 80);
      print(latitude);
      print(longitude);
      print('-' * 80);
    } catch (e) {
      print(e);
    }
  }
}
