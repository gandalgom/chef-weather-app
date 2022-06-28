import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Network(this.weatherUrl, this.airUrl);

  final String weatherUrl;
  final String airUrl;

  Future<dynamic> getWeatherData() async => _getJSONData(weatherUrl);
  Future<dynamic> getAirData() async => _getJSONData(airUrl);

  Future<dynamic> _getJSONData(String urlPath) async {
    http.Response response = await http.get(Uri.parse(urlPath));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }
}