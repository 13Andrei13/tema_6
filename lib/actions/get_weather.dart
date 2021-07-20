import 'package:tema6_weather/actions/index.dart';
import 'package:tema6_weather/models/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_weather.freezed.dart';

@freezed
class GetWeather with _$GetWeather implements AppAction {
  const factory GetWeather() = GetWeatherStart;

  const factory GetWeather.successful(Weather weather) = GetWeatherSuccessful;

  @Implements(ErrorAction)
  const factory GetWeather.error(Object error, StackTrace stackTrace) = GetWeatherError;
}

/*
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
*/
