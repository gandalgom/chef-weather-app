import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Network(this.urlPath);

  final String urlPath;

  Future<dynamic> getJSONData() async {
    http.Response response = await http.get(Uri.parse(urlPath));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }
}