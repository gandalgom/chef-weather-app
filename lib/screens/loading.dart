import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screens/weather_info.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  MyLocation myLocation = MyLocation();

  // TODO: Input your API key
  static const _apiKey = '**********';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.white, size: 80.0),
      ),
    );
  }

  void fetchData() async {
    try {
      await myLocation.getCurrentPosition();
      if (myLocation.latitude != null && myLocation.longitude != null) {
        Network net = Network(
          'https://api.openweathermap.org/data/2.5/weather'
            '?lat=${myLocation.latitude}&lon=${myLocation.longitude}'
            '&appid=$_apiKey&units=metric',
          'https://api.openweathermap.org/data/2.5/air_pollution'
            '?lat=${myLocation.latitude}&lon=${myLocation.longitude}'
            '&appid=$_apiKey&units=metric'
        );
        var weatherData = await net.getWeatherData();
        var airPollutionData = await net.getAirData();

        if (weatherData != null && airPollutionData != null) {
          if (mounted) {
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => WeatherInfo(
                  parseWeatherData: weatherData,
                  parseAirData: airPollutionData,
                )
              )
            );
          } else {
            showErrorMessage("Weather info page hasn't mounted");
          }
        } else {
          showErrorMessage("Can't receive weather data");
        }
      } else {
        showErrorMessage("Can't check my location");
      }
    } on Exception catch (e) {
      showErrorMessage(e.toString());
    }
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 1),
      )
    );
  }
}
