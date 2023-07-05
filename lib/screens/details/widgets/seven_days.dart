import 'package:farmsetu_weather/repository/dataset.dart';
import 'package:farmsetu_weather/res/constant_colors.dart';
import 'package:flutter/material.dart';
import '../../../res/dimens.dart';
import '../../../utils/size_config.dart';

class SevenDays extends StatelessWidget {
  final List<Weather> sevenDay;

  const SevenDays(this.sevenDay, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: ConstantColors.lightGreyColor,
        child: ListView.builder(
            itemCount: sevenDay.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.defaultSize! * Dimens.size20,
                      right: SizeConfig.defaultSize! * Dimens.size20,
                      bottom: SizeConfig.defaultSize! * Dimens.size25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///----------------- 7 days name -----------------
                      Text(sevenDay[index].day,
                          style: TextStyle(
                            color: ConstantColors.blackColor,
                              fontSize: SizeConfig.defaultSize! * Dimens.size20)),
                      Container(
                        width: SizeConfig.defaultSize! * Dimens.size130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ///-----------------  -----------------
                            Image(
                              image: AssetImage(sevenDay[index].image),
                              width: SizeConfig.defaultSize! * Dimens.size40,
                            ),
                            SizedBox(
                                width:
                                SizeConfig.defaultSize! * Dimens.size15),
                            ///----------------- Temperature name of all days -----------------
                            Text(
                              sevenDay[index].name,
                              style: TextStyle(
                                  color: ConstantColors.blackColor,
                                  fontSize:
                                  SizeConfig.defaultSize! * Dimens.size20),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          ///----------------- Temperature values of all days -----------------
                          Text(
                            "+" + sevenDay[index].max.toString() + "\u00B0",
                            style: TextStyle(
                                fontSize: SizeConfig.defaultSize! * Dimens.size20),
                          ),
                        ],
                      )
                    ],
                  ));
            }),
      ),
    );
  }
}
