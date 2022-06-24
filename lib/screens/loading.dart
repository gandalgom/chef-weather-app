import 'package:flutter/material.dart';

import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';

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
    );
  }

  void setPositionLabel() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getCurrentPosition();

    String result = myLocation.longitude != null && myLocation.longitude != null
      ? 'Latitude: ${myLocation.latitude}, Longitude: ${myLocation.longitude}'
      : myLocation.errorMessage;

    setState(() => currentPosition = result);
  }

  void fetchData() async {
    Network net = Network('https://samples.openweathermap.org/data/2.5/'
        'weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
    var parsingData = await net.getJSONData();

    if (parsingData != null) {
      var description = parsingData['weather'][0]['description'];
      var wind = parsingData['wind']['speed'];
      var id = parsingData['id'].toString();

      String result = 'description: $description\nwind speed: $wind\nid : $id';
      setState(() => currentWeather = result);
    }
  }
}
