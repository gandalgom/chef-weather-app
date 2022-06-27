import 'package:flutter/material.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({Key? key, this.parseWeatherData}) : super(key: key);

  final dynamic parseWeatherData;

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {

  late String cityName;
  late int temperature;

  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cityName,
                style: const TextStyle(fontSize: 30.0),
              ),
              const SizedBox(height: 20.0),
              Text(
                '$temperature℃',
                style: const TextStyle(fontSize: 30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateData(dynamic weatherData) {
    cityName = weatherData['name'];

    double rawTemperature = weatherData['main']['temp'];
    temperature = rawTemperature.round();
  }
}
