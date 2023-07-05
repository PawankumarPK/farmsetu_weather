import 'package:farmsetu_weather/screens/details/controller/detail_controller.dart';
import 'package:farmsetu_weather/screens/home/controller/home_controller.dart';
import 'package:farmsetu_weather/screens/map/controller/map_controller.dart';
import 'package:get/get.dart';


class ControllersBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DetailController>(() => DetailController());
    Get.lazyPut<MapController>(() => MapController());

  }

}