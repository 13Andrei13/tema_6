import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:tema6_weather/actions/get_location.dart';
import 'package:tema6_weather/actions/get_weather.dart';
import 'package:tema6_weather/data/location_api.dart';
import 'package:tema6_weather/data/weather_api.dart';
import 'package:tema6_weather/models/app_state.dart';
import 'package:tema6_weather/models/location.dart';
import 'package:tema6_weather/models/weather.dart';

class AppEpics {
  AppEpics({required LocationApi locationApi, required WeatherApi weatherApi})
      : _locationApi = locationApi,
        _weatherApi = weatherApi;

  final LocationApi _locationApi;
  final WeatherApi _weatherApi;

  Epic<AppState> get epics {
    return combineEpics<AppState>(<Epic<AppState>>[
      TypedEpic<AppState, GetLocation>(_getLocation),
      TypedEpic<AppState, GetWeather>(_getWeather),
    ]);
  }

  Stream<Object> _getLocation(Stream<GetLocation> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((GetLocation action) => _locationApi.getLocation())
        .expand((Location location) {
      return <Object>[
        GetLocationSuccessful(location),
        GetWeather(),
      ];
    }).onErrorReturnWith((Object error, StackTrace stackTrace) => GetLocationError(error));
  }

  Stream<dynamic> _getWeather(Stream<GetWeather> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((GetWeather action) => _weatherApi.getWeather(store.state.location!.city))
        .map<Object>((Weather weather) => GetWeatherSuccessful(weather))
        .onErrorReturnWith((Object error, StackTrace stackTrace) => GetWeatherError(error));
  }
}
