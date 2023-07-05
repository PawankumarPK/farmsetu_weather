import 'package:farmsetu_weather/repository/dataset.dart';
import 'package:farmsetu_weather/res/constant_colors.dart';
import 'package:farmsetu_weather/res/constant_strings.dart';
import 'package:farmsetu_weather/res/dimens.dart';
import 'package:farmsetu_weather/screens/home/controller/home_controller.dart';
import 'package:farmsetu_weather/screens/map/screen/map_screen.dart';
import 'package:farmsetu_weather/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'extra_weather.dart';

class CurrentWeather extends StatefulWidget {
  final Function() updateData;

  const CurrentWeather(this.updateData, {Key? key}) : super(key: key);

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  var homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: SizeConfig.defaultSize! * Dimens.size50,
          left: SizeConfig.defaultSize! * Dimens.size30,
          right: SizeConfig.defaultSize! * Dimens.size30),
      color: ConstantColors.blackColor,
      child: Column(
        children: [
          ///----------------- Top section -----------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///----------------- City name -----------------
              Row(
                children: [
                  Icon(CupertinoIcons.location_solid, color: ConstantColors.whiteColor),
                  Text(
                    " " + homeController.currentTemp.value!.location,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.defaultSize! * Dimens.size20),
                  ),
                ],
              ),

              ///----------------- Open Map Text -----------------
              GestureDetector(
                onTap: () => {Get.to(const MapScreen())},
                child: Text(
                  ConstantStrings.openMap,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.defaultSize! * Dimens.size20),
                ),
              ),
            ],
          ),
          Column(
            children: [
              ///----------------- Temperature related image -----------------
              Image(
                image: AssetImage(homeController.currentTemp.value!.image),
                width: SizeConfig.defaultSize! * Dimens.size120,
                height: SizeConfig.defaultSize! * Dimens.size120,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.defaultSize! * Dimens.size120,
                    bottom: SizeConfig.defaultSize! * Dimens.size20),
                child: Column(
                  children: [
                    ///----------------- Current Temperature value text -----------------
                    Text(
                      homeController.currentTemp.value!.current.toString(),
                      style: TextStyle(
                          height: 0.1,
                          fontSize: SizeConfig.defaultSize! * Dimens.size120,
                          fontWeight: FontWeight.bold),
                    ),

                    ///----------------- Temperature name text -----------------
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size20),
                      child: Text(homeController.currentTemp.value!.name,
                          style: TextStyle(
                            color: ConstantColors.whiteColor,
                            fontSize: SizeConfig.defaultSize! * Dimens.size20,
                          )),
                    ),
                  ],
                ),
              ),

              ///----------------- Extra info of temperature -----------------
              Padding(
                  padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size20),
                  child: ExtraWeather(homeController.currentTemp.value!))
            ],
          ),
        ],
      ),
    );
  }
}
