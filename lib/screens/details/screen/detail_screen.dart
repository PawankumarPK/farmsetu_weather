import 'package:farmsetu_weather/screens/details/widgets/seven_days.dart';
import 'package:farmsetu_weather/screens/details/widgets/tomorrow_weather.dart';
import 'package:farmsetu_weather/screens/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());

    return Column(
      children: [
        TomorrowWeather(homeController.tomorrowTemp.value!),
        SevenDays(homeController.sevenDay)
      ],
    );
  }
}
