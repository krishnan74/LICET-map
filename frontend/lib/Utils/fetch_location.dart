import 'dart:ffi';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

Future<String> getLocation() async{
  Location location = Location();
  var currentLocation = await location.getLocation();
  var lat = currentLocation.latitude;
  var long = currentLocation.longitude;
  var currentBlock = "";

  if(lat == 37.4219983 && long == -122.084){
    currentBlock = "A";
  }

  else if(lat == 34.3443 && long == 23.485){
    currentBlock = "B";
  }

  else{
    currentBlock = "F";
  }
  print('$lat, $long');

  return currentBlock;
}

