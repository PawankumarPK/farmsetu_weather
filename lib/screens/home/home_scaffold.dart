import 'package:farmsetu_weather/res/constant_colors.dart';
import 'package:farmsetu_weather/screens/home/screen/home_screen.dart';
import 'package:farmsetu_weather/utils/size_config.dart';
import 'package:flutter/material.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: ConstantColors.blackColor,
        body: const HomeScreen()
    );

}
}










