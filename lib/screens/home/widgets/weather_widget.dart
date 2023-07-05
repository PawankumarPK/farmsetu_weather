import 'package:farmsetu_weather/repository/dataset.dart';
import 'package:farmsetu_weather/res/constant_colors.dart';
import 'package:farmsetu_weather/res/dimens.dart';
import 'package:farmsetu_weather/utils/size_config.dart';
import 'package:flutter/material.dart';



class WeatherWidget extends StatelessWidget {
  final Weather weather;

  const WeatherWidget(this.weather);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * Dimens.size7),
      child: Column(
        children: [
          ///----------------- temperature value text -----------------
          Text(
            weather.current.toString() + "\u00B0",
            style: TextStyle(
              color: ConstantColors.blackColor,
                fontSize: SizeConfig.defaultSize! * Dimens.size20),
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * Dimens.size5,
          ),
          ///----------------- temperature related image -----------------
          Image(
            image: AssetImage(weather.image),
            width: SizeConfig.defaultSize! * Dimens.size50,
            height: SizeConfig.defaultSize! * Dimens.size50,
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * Dimens.size5,
          ),
          ///----------------- Today's time text -----------------
          Text(
            weather.time,
            style: TextStyle(
                fontSize: SizeConfig.defaultSize! * Dimens.size16,
                color: ConstantColors.blackColor),
          )
        ],
      ),
    );
  }
}
