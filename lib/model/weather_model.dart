import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherModel {
  Widget getWeatherIcon(int condition) {
    final String conditionName;

    if (condition < 300) {
      conditionName = 'cloud_lightning';
    } else if (condition < 500) {
      conditionName = 'cloud_drizzle';
    } else if (condition != 511 && condition < 600) {
      conditionName = 'cloud_rain';
    } else if (condition == 511 || condition < 700) {
      conditionName = 'cloud_snow_alt';
    } else if (condition < 800) {
      conditionName = 'cloud_fog';
    } else if (condition == 800) {
      conditionName = 'sun';
    } else {
      conditionName = 'cloud_sun';
    }

    return SvgPicture.asset(
      'images/svg/climacon-$conditionName.svg',
      color: Colors.black87,
    );
  }
}