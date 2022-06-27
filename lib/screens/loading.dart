import 'package:flutter/material.dart';

import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screens/weather_info.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String currentPosition = 'Where is my location?';
  String currentWeather = "How's the weather?";

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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => setPositionLabel(),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(color: Colors.white),
                ),
                child: const Text('Get my location'),
              ),
              const SizedBox(height: 40.0),
              Text(
                currentPosition,
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 40.0),
              Text(currentWeather),
            ],
          ),
        ),
      ),
    );
  }

  void setPositionLabel() async {
    await myLocation.getCurrentPosition();

    String result = myLocation.latitude != null && myLocation.longitude != null
      ? 'Latitude: ${myLocation.latitude}, Longitude: ${myLocation.longitude}'
      : myLocation.errorMessage;

    setState(() => currentPosition = result);
  }

  void fetchData() async {
    try {
      await myLocation.getCurrentPosition();
      if (myLocation.latitude != null && myLocation.longitude != null) {
        Network net = Network('https://api.openweathermap.org/data/2.5/weather'
            '?lat=${myLocation.latitude}&lon=${myLocation.longitude}'
            '&appid=$_apiKey&units=metric');
        var weatherData = await net.getJSONData();

        if (weatherData != null) {
          if (mounted) {
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => WeatherInfo(parseWeatherData: weatherData)
              )
            );
          } else {
            setState(() => currentWeather = "Weather info page hasn't mounted");
          }
        } else {
          setState(() => currentWeather = "Can't receive weather data");
        }
      } else {
        setState(() => currentWeather = "Can't check my location");
      }
    } on Exception catch (e) {
      setState(() => currentWeather = e.toString());
    }
  }
}
