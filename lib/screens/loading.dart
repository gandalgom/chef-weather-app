import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String currentPosition = 'Where is my location?';
  String currentWeather = "How's the weather?";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  Position newPosition = await _determinePosition();
                  setState(() => currentPosition = newPosition.toString());
                } catch (e) {
                  setState(() => currentPosition = e.toString());
                }
              },
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
    );
  }

  void resetScreenInfo() {
    setState(() {
      currentPosition = 'Where is my location?';
      currentWeather = "How's the weather?";
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied,\n'
        'we cannot request permissions.'
      );
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
  }

  void fetchData() async {
    var url = Uri.parse('https://samples.openweathermap.org/data/2.5/'
      'weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
    http.Response response = await http.get(url);

    final String resultData;

    if (response.statusCode == 200) {
      String jsonData = response.body;
      var description = jsonDecode(jsonData)['weather'][0]['description'];
      var wind = jsonDecode(jsonData)['wind']['speed'];
      var id = jsonDecode(jsonData)['id'].toString();

      resultData = 'description: $description\nwind speed: $wind\nid : $id';
    } else {
      resultData = 'Cannot collect weather info!';
    }

    setState(() => currentWeather = resultData);
  }
}
