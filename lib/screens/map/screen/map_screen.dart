import 'package:farmsetu_weather/res/constant_strings.dart';
import 'package:farmsetu_weather/screens/home/controller/home_controller.dart';
import 'package:farmsetu_weather/screens/map/controller/map_controller.dart';
import 'package:farmsetu_weather/screens/map/forecast_tile_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {

  var homeController = Get.put(HomeController());
  var mapController = Get.put(MapController());

  static const CameraPosition initialCameraPosition =
  CameraPosition(target: LatLng(28.6139, 77.2090), zoom: 14.0);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              markers: Set<Marker>.of(mapController.marker),

              initialCameraPosition: initialCameraPosition,
              onMapCreated: (GoogleMapController controller)async {
                mapController.googleMapController = controller;

                mapController.googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                        target: LatLng(double.parse(homeController.lat.value), double.parse(homeController.lon.value)), zoom: 14)));

                mapController.marker.add(Marker(
                    markerId: const MarkerId("100"),
                    position: LatLng(double.parse(homeController.lat.value),  double.parse(homeController.lon.value)),
                    infoWindow:  InfoWindow(title: ConstantStrings.yourLocation)));


                setState(() {
                  mapController.controller = controller;
                });
                initTiles(mapController.forecastDate);
              },
              tileOverlays: mapController.tileOverlay == null ? {} : <TileOverlay>{mapController.tileOverlay!},
            ),
          ],
        ),
    );
  }


  initTiles(DateTime date) async {
    final String overlayId = date.millisecondsSinceEpoch.toString();

    final TileOverlay tileOverlay = TileOverlay(
      tileOverlayId: TileOverlayId(overlayId),
      tileProvider: ForecastTileProvider(
        dateTime: date,
        mapType: 'PR0',
        opacity: 0.4,
      ),
    );
    setState(() {
      mapController.tileOverlay = tileOverlay;
    });
  }

}