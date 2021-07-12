import 'package:tema6_weather/models/weather.dart';

class GetWeather {}

class GetWeatherSuccessful {
  GetWeatherSuccessful(this.weather);

  final Weather weather;

  @override
  String toString() {
    return 'GetWeatherSuccessful{weather: $weather}';
  }
}

class GetWeatherError {
  GetWeatherError(this.error);

  final Object error;

  @override
  String toString() {
    return 'GetWeatherError{weather: $error}';
  }
}
