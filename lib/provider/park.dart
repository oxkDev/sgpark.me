import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../const.dart';
import 'sample_provider.dart';

// Map<String, dynamic> sampleData = ;

enum VehCat {
  car,
  heavyVehicle,
  motorcycle,
}

Map<String, VehCat> vehCatRef = {
  "C": VehCat.car,
  "H": VehCat.heavyVehicle,
  "M": VehCat.motorcycle,
  "Car": VehCat.car,
  "Heavy Vehicle": VehCat.heavyVehicle,
  "Motorcycle": VehCat.motorcycle,
};

class ParkingInformation {
  final int weekdayMin;
  final String ppName;
  final String endTime;
  final double weekdayRate;
  final String startTime;
  final String ppCode;
  final double sunPHRate;
  final int satdayMin;
  final int sunPHMin;
  final String parkingSystem;
  final int parkCapacity;
  final VehCat vehCat;
  final double satdayRate;
  final List<LatLng> geometries;

  ParkingInformation({
    required this.weekdayMin,
    required this.ppName,
    required this.endTime,
    required this.weekdayRate,
    required this.startTime,
    required this.ppCode,
    required this.sunPHRate,
    required this.satdayMin,
    required this.sunPHMin,
    required this.parkingSystem,
    required this.parkCapacity,
    required this.vehCat,
    required this.satdayRate,
    required this.geometries,
  });
}

class CarParkAPI extends ChangeNotifier {
  ParkingInformation? parkingInfo;
  List<ParkingInformation>? parkingInfos;
  //getters
  ParkingInformation? get getParkingInfo {
    return parkingInfo;
  }

  bool get isLoaded {
    return parkingInfo != null;
  }

  String get name {
    retrieveData();
    return parkingInfo!.ppName;
    // return "ef";
  }

  LatLng get location {
    return parkingInfo!.geometries[0];
  }

  Map<String, String>? get rates {
    if (parkingInfo == null) {
      return null;
    } else {
      return {
        "Weekdays":
            "\$${parkingInfo!.weekdayRate} / ${parkingInfo!.weekdayMin} min",
        "Sat": "\$${parkingInfo!.satdayRate} / ${parkingInfo!.satdayMin} min",
        "Sun":
            "Peek Hours: \$${parkingInfo!.sunPHRate} / ${parkingInfo!.sunPHMin} min",
      };
    }
  }

  String get timing {
    return "${parkingInfo!.startTime} - ${parkingInfo!.endTime}";
  }

  // actions
  void retrieveData() {
    parkingInfos = jsonDecode(sampleJSONObjResult)["Result"]
        .map<ParkingInformation>((value) {
      return ParkingInformation(
        weekdayMin: int.parse(value["weekdayMin"].split("mins")[0]),
        ppName: value["ppName"],
        endTime: value["endTime"],
        weekdayRate: double.parse(value["weekdayRate"].split("\$")[1]),
        startTime: value["startTime"],
        ppCode: value["ppCode"],
        sunPHRate: double.parse(value["sunPHRate"].split("\$")[1]),
        satdayMin: int.parse(value["satdayMin"].split("mins")[0]),
        sunPHMin: int.parse(value["sunPHMin"].split("mins")[0]),
        parkingSystem: value["parkingSystem"],
        parkCapacity: value["parkCapacity"],
        vehCat: vehCatRef[value["vehCat"]]!,
        satdayRate: double.parse(value["satdayRate"].split("\$")[1]),
        geometries: value["geometries"].map<LatLng>((val) {
          List<String> coordinates = val["coordinates"].split(", ");
          return LatLng(
              double.parse(coordinates[0]), double.parse(coordinates[1]));
        }).toList(),
      );
    }).toList();
  }

  void selectResult(int index) {
    parkingInfo = parkingInfos![index];
    stream.add(parkingInfo!);
  }
}
