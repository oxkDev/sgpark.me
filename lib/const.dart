import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sgpark_me/provider/park.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Colours {
  bool light = true;

  void setTheme() {
    light = !light;
  }

  void setColours() {
    if (light) {}
  }
}

BoxShadow boxShadow(Color shadowColour) {
  return BoxShadow(
    color: shadowColour,
    offset: Offset.zero,
    blurRadius: 30,
    spreadRadius: 2,
  );
}

final PanelController panelController = PanelController();

CameraPosition initialPosition(LatLng position) {
  return CameraPosition(target: position, zoom: 20, tilt: 0, bearing: 0);
}

class MainColours {
  static const orange = Color(0xFFFF8A15);
  static const lightOrange = Color(0xFFFFBE7C);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const lightGrey = Color(0xFFEBEBEB);
  static const darkGrey = Color(0xFF717171);
  static const darkText = Color(0xFF4D4D4D);
  static const grey = Color(0xFF808080);
  static const loading = Color(0xFFCACACA);
  static const red = Color(0xFFFF613B);
  static const shadow = Color(0x15000000);
}

class SubColours {
  static const splash = Color(0x55EBEBEB);
  static const green = Color(0xFF44DB16);
  static const darkGreen = Color(0xFF38BC10);
  static const yellow = Color(0xFFF7B400);
  static const red = Color(0xFFFF705D);
  static const translucent = Color(0x50000000);
}

class Dimensions {
  final double width;
  final double height;
  Dimensions({
    required this.width,
    required this.height,
  });
}

CarParkAPI parkingInfo = CarParkAPI();

Stream<ParkingInformation> parkingStream = stream.stream;
StreamController<ParkingInformation> stream =
    StreamController<ParkingInformation>();
