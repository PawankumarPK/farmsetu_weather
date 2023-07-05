import 'package:farmsetu_weather/repository/dataset.dart';
import 'package:farmsetu_weather/res/constant_colors.dart';
import 'package:farmsetu_weather/screens/details/widgets/seven_days.dart';
import 'package:farmsetu_weather/screens/details/widgets/tomorrow_weather.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  late Weather tomorrowTemp;
  late List<Weather> sevenDay;

  DetailPage(this.tomorrowTemp, this.sevenDay, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///----------------- Selected city temperature details widgets -----------------
    return Scaffold(
      backgroundColor: ConstantColors.blackColor,
      body: Column(
        children: [TomorrowWeather(tomorrowTemp), SevenDays(sevenDay)],
      ),
    );
  }
}


