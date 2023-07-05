import 'package:farmsetu_weather/res/constant_colors.dart';
import 'package:farmsetu_weather/res/constant_strings.dart';
import 'package:farmsetu_weather/res/dimens.dart';
import 'package:farmsetu_weather/screens/details/detail_scaffold.dart';
import 'package:farmsetu_weather/screens/home/controller/home_controller.dart';
import 'package:farmsetu_weather/screens/home/widgets/weather_widget.dart';
import 'package:farmsetu_weather/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_scaffold.dart';

class TodayWeather extends StatefulWidget {
  TodayWeather({Key? key}) : super(key: key);

  @override
  State<TodayWeather> createState() => _TodayWeatherState();
}

class _TodayWeatherState extends State<TodayWeather> {
  var homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size50),
          child: Container(
            color: ConstantColors.lightGreyColor,
            child: Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.defaultSize! * Dimens.size30,
                  right: SizeConfig.defaultSize! * Dimens.size30,
                  top: SizeConfig.defaultSize! * Dimens.size10),
              child: Column(
                children: [
                  ///-----------------Today & possible temperature section -----------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ConstantStrings.today,
                        style: TextStyle(
                            color: ConstantColors.blackColor,
                            fontSize: SizeConfig.defaultSize! * Dimens.size25,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => DetailPage(
                              homeController.tomorrowTemp.value!, homeController.sevenDay!));
                        },
                        child: Row(
                          children: [
                            ///----------------- 7 days text with icon-----------------
                            Text(
                              ConstantStrings.sevenDays,
                              style: TextStyle(
                                  fontSize: SizeConfig.defaultSize! * Dimens.size17,
                                  color: ConstantColors.blackColor),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: ConstantColors.blackColor,
                              size: SizeConfig.defaultSize! * Dimens.size15,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * Dimens.size15,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: SizeConfig.defaultSize! * Dimens.size30,
                    ),

                    ///-----------------Today's hourly temperature details -----------------
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      WeatherWidget(homeController.todayWeather![0]),
                      WeatherWidget(homeController.todayWeather![1]),
                      WeatherWidget(homeController.todayWeather![2]),
                      WeatherWidget(homeController.todayWeather![3])
                    ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
