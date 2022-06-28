import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: const Color(0xffe79e4a),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_searching),
            onPressed: () {},
            iconSize: 30.0,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 150.0),
            Text(
              'Seoul',
              style: GoogleFonts.lato(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
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
