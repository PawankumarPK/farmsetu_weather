import 'package:farmsetu_weather/res/constant_colors.dart';
import 'package:farmsetu_weather/screens/map/screen/map_screen.dart';
import 'package:flutter/material.dart';

class MapScaffold extends StatelessWidget {
  const MapScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        backgroundColor: ConstantColors.blackColor,
        body: const MapScreen()
    );
  }
}
