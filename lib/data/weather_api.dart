import 'dart:convert';

import 'package:http/http.dart';
import 'package:tema6_weather/models/index.dart';

class WeatherApi {
  WeatherApi({required String apiUrl, required Client client})
      : _apiUrl = apiUrl,
        _client = client;

  final String _apiUrl;
  final Client _client;

  Future<Weather> getWeather(String city) async {
    final Uri uri = Uri.parse('$_apiUrl&q=$city&aqi=no');
    final Response response = await _client.get(uri);

    if (response.statusCode >= 300) {
      throw StateError(response.body);
    }

    final Map<String, dynamic> body = jsonDecode(response.body) as Map<String, dynamic>;
    final Map<String, dynamic> current = body['current'] as Map<String, dynamic>;

    return Weather.fromJson(current);
  }
}
