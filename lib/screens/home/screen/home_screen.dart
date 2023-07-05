import 'package:farmsetu_weather/screens/home/controller/home_controller.dart';
import 'package:farmsetu_weather/screens/home/widgets/current_weather.dart';
import 'package:farmsetu_weather/screens/home/widgets/today_weather.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => homeController.currentTemp.value == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  CurrentWeather(homeController.getData),
                  TodayWeather()
                ],
              ),
            )),
    );
  }
}
