import 'dart:convert';
import 'package:farmsetu_weather/apiService/url/config.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Weather {
  int max = 0;
  int min;
  final int current;
  final String name;
  final String day;
  final int wind;
  final int humidity;
  final int chanceRain;
  final String image;
  final String time;
  final String location;

  Weather(
      {required this.max,
      required this.min,
      required this.name,
      required this.day,
      required this.wind,
      required this.humidity,
      required this.chanceRain,
      required this.image,
      required this.current,
      required this.time,
      required this.location});
}

///----------------- Load & decode all data from JSON  -----------------------
Future<List> fetchData(String lat, String lon, String city) async {
  var url =
      "${Config.openWhetherMap}/data/2.5/onecall?lat=$lat&lon=$lon&units=metric&appid=${Config.appId}";
  var response = await http.get(Uri.parse(url));
  DateTime date = DateTime.now();
  if (response.statusCode == 200) {
    var res = json.decode(response.body);
    ///------------------------  current Temp -------------------------
    var current = res["current"];
    Weather currentTemp = Weather(
        current: current["temp"]?.round() ?? 0,
        name: current["weather"][0]["main"].toString(),
        day: DateFormat("EEEE dd MMMM").format(date),
        wind: current["wind_speed"]?.round() ?? 0,
        humidity: current["humidity"]?.round() ?? 0,
        chanceRain: current["uvi"]?.round() ?? 0,
        location: city,
        image: findIcon(current["weather"][0]["main"].toString(), true),
        min: 0,
        max: 0,
        time: '');

    ///------------------------  today weather -------------------------
    List<Weather> todayWeather = [];
    int hour = int.parse(DateFormat("hh").format(date));
    for (var i = 0; i < 4; i++) {
      var temp = res["hourly"];
      var hourly = Weather(
        current: temp[i]["temp"]?.round() ?? 0,
        image: findIcon(temp[i]["weather"][0]["main"].toString(), false),
        time: Duration(hours: hour + i + 1).toString().split(":")[0] + ":00",
        location: '',
        name: '',
        max: 0,
        wind: 0,
        day: '',
        chanceRain: 0,
        humidity: 0,
        min: 0,
      );
      todayWeather.add(hourly);
    }

    ///------------------------ Tomorrow Weather -------------------------
    var daily = res["daily"][0];
    Weather tomorrowTemp = Weather(
        max: daily["temp"]["max"]?.round() ?? 0,
        min: daily["temp"]["min"]?.round() ?? 0,
        image: findIcon(daily["weather"][0]["main"].toString(), true),
        name: daily["weather"][0]["main"].toString(),
        wind: daily["wind_speed"]?.round() ?? 0,
        humidity: daily["rain"]?.round() ?? 0,
        chanceRain: daily["uvi"]?.round() ?? 0,
        time: '',
        current: 0,
        day: '',
        location: '');

    ///------------------------ Seven Day Weather -------------------------
    List<Weather> sevenDay = [];
    for (var i = 1; i < 8; i++) {
      String day = DateFormat("EEEE")
          .format(DateTime(date.year, date.month, date.day + i + 1))
          .substring(0, 3);
      var temp = res["daily"][i];
      var hourly = Weather(
          max: temp["temp"]["max"]?.round() ?? 0,
          min: temp["temp"]["min"]?.round() ?? 0,
          image: findIcon(temp["weather"][0]["main"].toString(), false),
          name: temp["weather"][0]["main"].toString(),
          day: day,
          current: 0,
          wind: 0,
          location: '',
          humidity: 0,
          time: '',
          chanceRain: 0);
      sevenDay.add(hourly);
    }
    return [currentTemp, todayWeather, tomorrowTemp, sevenDay];
  }
  return [null, null, null, null];
}

///------------------------ Find Icon -------------------------
String findIcon(String name, bool type) {
  if (type) {
    switch (name) {
      case "Clouds":
        return "assets/sunny.png";
      case "Rain":
        return "assets/rainy.png";
      case "Drizzle":
        return "assets/rainy.png";
      case "Thunderstorm":
        return "assets/thunder.png";
      case "Snow":
        return "assets/snow.png";
      default:
        return "assets/sunny.png";
    }
  } else {
    switch (name) {
      case "Clouds":
        return "assets/sunny.png";
      case "Rain":
        return "assets/rainy.png";
      case "Drizzle":
        return "assets/rainy.png";
      case "Thunderstorm":
        return "assets/thunder.png";
      case "Snow":
        return "assets/snow.png";
      default:
        return "assets/sunny.png";

    }
  }
}