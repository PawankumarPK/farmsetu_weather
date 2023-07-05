import 'package:farmsetu_weather/repository/dataset.dart';
import 'package:farmsetu_weather/res/constant_colors.dart';
import 'package:farmsetu_weather/res/constant_strings.dart';
import 'package:farmsetu_weather/res/dimens.dart';
import 'package:farmsetu_weather/screens/home/widgets/extra_weather.dart';
import 'package:farmsetu_weather/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TomorrowWeather extends StatelessWidget {
  final Weather tomorrowTemp;

  const TomorrowWeather(this.tomorrowTemp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ConstantColors.blackColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.defaultSize! * Dimens.size20,
                  right: SizeConfig.defaultSize! * Dimens.size50,
                  left: SizeConfig.defaultSize! * Dimens.size30,
                  bottom: SizeConfig.defaultSize! * Dimens.size20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },

                      ///-----------------Back arrow icon -----------------
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: ConstantColors.whiteColor,
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.defaultSize! * Dimens.size10,
                  left: SizeConfig.defaultSize! * Dimens.size15,
                  bottom: SizeConfig.defaultSize! * Dimens.size20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 4,
                    child: Container(
                      width: SizeConfig.defaultSize! * Dimens.size120,
                      height: SizeConfig.defaultSize! * Dimens.size120,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(tomorrowTemp.image))),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///-----------------Tomorrow text -----------------
                        Text(
                          ConstantStrings.tomorrow,
                          style: TextStyle(
                              fontSize: SizeConfig.defaultSize! * Dimens.size30, height: 0.1),
                        ),
                        Container(
                          height: SizeConfig.defaultSize! * Dimens.size120,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ///----------------- Max possible temperature value -----------------
                              Text(
                                tomorrowTemp.max.toString(),
                                style: TextStyle(
                                    fontSize: SizeConfig.defaultSize! * Dimens.size100,
                                    fontWeight: FontWeight.bold),
                              ),

                              ///----------------- Min possible temperature value -----------------

                              Text(
                                "/" + tomorrowTemp.min.toString() + "\u00B0",
                                style: TextStyle(
                                    color: ConstantColors.lightGreyColor,
                                    fontSize: SizeConfig.defaultSize! * Dimens.size40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize! * Dimens.size10,
                        ),

                        ///----------------- Temperature name text -----------------
                        Text(
                          " " + tomorrowTemp.name,
                          style: TextStyle(
                            fontSize: SizeConfig.defaultSize! * Dimens.size15,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: SizeConfig.defaultSize! * Dimens.size20,
                right: SizeConfig.defaultSize! * Dimens.size20,
                left: SizeConfig.defaultSize! * Dimens.size20,
              ),
              child: Column(
                children: [
                  Divider(color: ConstantColors.whiteColor),
                  SizedBox(
                    height: SizeConfig.defaultSize! * Dimens.size10,
                  ),

                  ///----------------- Extra temperature details section -----------------
                  ExtraWeather(tomorrowTemp)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
