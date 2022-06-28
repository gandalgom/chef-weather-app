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

  Widget getAQIIcon(int index) {
    final String aqiStatus;

    if (index == 1) {
      aqiStatus = 'good';
    } else if (index == 2) {
      aqiStatus = 'fair';
    } else if (index == 3) {
      aqiStatus = 'moderate';
    } else if (index == 4) {
      aqiStatus = 'poor';
    } else {
      aqiStatus = 'bad';
    }

    return Image.asset('images/png/$aqiStatus.png', width: 37.0, height: 35.0);
  }

  Widget getAirCondition(int index) {
    Color textColor = index < 3 ? Colors.indigo : Colors.black87;
    final String conditionText;
    if (index == 1) {
      conditionText = '"매우좋음"';
    } else if (index == 2) {
      conditionText = '"좋음"';
    } else if (index == 3) {
      conditionText = '"보통"';
    } else if (index == 4) {
      conditionText = '"나쁨"';
    } else {
      conditionText = '"매우나쁨"';
    }

    return Text(
      conditionText,
      style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
    );
  }
}