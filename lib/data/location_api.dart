import 'dart:convert';

import 'package:http/http.dart';
import 'package:tema6_weather/models/location.dart';

class LocationApi {
  const LocationApi({required String apiUrl, required Client client})
      : _apiUrl = apiUrl,
        _client = client;

  final String _apiUrl;
  final Client _client;

  Future<Location> getLocation() async {
    final Uri uri = Uri.parse(_apiUrl);
    final Response response = await _client.get(uri);

    if (response.statusCode >= 300) {
      throw StateError(response.body);
    }

/*
  final Map<String, dynamic> body =
      jsonDecode(response.body) as Map<String, dynamic>;
  final Location location = Location.fromJson(body);

  return location;
*/
//echiv cu =>>>>

    return Location.fromJson(jsonDecode(response.body));
  }
}
