
import 'package:farmsetu_weather/repository/dataset.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;

  //Weather? currentTemp ;
  final currentTemp = Rxn<Weather>();
  var todayWeather = <Weather>[].obs;
  final tomorrowTemp = Rxn<Weather>();
  var sevenDay = <Weather>[].obs;

  bool searchBar = false;
  bool updating = false;
  var focusNode = FocusNode();

  RxString lat = "".obs;
  RxString lon = "".obs;
  RxString city = "".obs;


  @override
  void onInit()  {
    super.onInit();
    determinePosition();
  }

  getData() async {
    isLoading.value = true;
    fetchData(lat.value, lon.value, city.value).then((value) {
      currentTemp.value = value[0];
      todayWeather.value = value[1];
      tomorrowTemp.value = value[2];
      sevenDay.value = value[3];
    });
    update();

  }


  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        return Future.error("Location services are disabled");
      }

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          return Future.error("Location permission denied");
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error("Location permission are permanently denied");
      }

      Position position = await Geolocator.getCurrentPosition();

      return position;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permission are permanently denied");
    }

    Position position = await Geolocator.getCurrentPosition();
    lat.value = position.latitude.toString();
    lon.value = position.longitude.toString();

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    city.value = placemarks[0].locality!.toString();

    getData();

    return position;
  }



}