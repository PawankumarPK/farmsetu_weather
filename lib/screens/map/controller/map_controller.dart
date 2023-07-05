
import 'package:farmsetu_weather/repository/dataset.dart';
import 'package:farmsetu_weather/screens/home/controller/home_controller.dart';
import 'package:farmsetu_weather/screens/map/forecast_tile_provider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  RxBool isLoading = false.obs;
  GoogleMapController? controller;

  TileOverlay? tileOverlay;

  DateTime forecastDate = DateTime.now();

  late GoogleMapController googleMapController;
  var homeController = Get.put(HomeController());
  List<Marker> marker = <Marker>[].obs;

}