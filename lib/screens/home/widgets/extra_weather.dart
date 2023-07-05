import 'package:farmsetu_weather/repository/dataset.dart';
import 'package:farmsetu_weather/res/constant_colors.dart';
import 'package:farmsetu_weather/res/constant_strings.dart';
import 'package:farmsetu_weather/res/dimens.dart';
import 'package:farmsetu_weather/utils/size_config.dart';
import 'package:flutter/material.dart';


class ExtraWeather extends StatelessWidget {
  final Weather temp;

  const ExtraWeather(this.temp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            SizedBox(
              height: SizeConfig.defaultSize! * Dimens.size10,
            ),
            ///-----------------Current Wind value -----------------
            Text(
              temp.wind.toString() + ConstantStrings.km,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.defaultSize! * Dimens.size16),
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * Dimens.size10,
            ),
            ///----------------- Wind text ---------------------------
            Text(
              ConstantStrings.wind,
              style: TextStyle(
                  color: ConstantColors.whiteColor,
                  fontSize: SizeConfig.defaultSize! * Dimens.size16),
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: SizeConfig.defaultSize! * Dimens.size10,
            ),
            ///----------------- Humidity value -----------------
            Text(
              temp.humidity.toString() + " %",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.defaultSize! * Dimens.size16),
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * Dimens.size10,
            ),
            ///----------------- Humidity text -----------------
            Text(
              ConstantStrings.humidity,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.defaultSize! * Dimens.size16),
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: SizeConfig.defaultSize! * Dimens.size10,
            ),
            ///----------------- Rain value -----------------
            Text(
              temp.chanceRain.toString() + " %",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.defaultSize! * Dimens.size16),
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * Dimens.size10,
            ),
            ///----------------- Rain text -----------------
            Text(
              ConstantStrings.rain,
              style: TextStyle(
                  color: ConstantColors.whiteColor,
                  fontSize: SizeConfig.defaultSize! * Dimens.size16),
            )
          ],
        )
      ],
    );
  }
}
