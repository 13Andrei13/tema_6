import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:tema6_weather/actions/get_location.dart';
import 'package:tema6_weather/actions/get_weather.dart';
import 'package:tema6_weather/actions/index.dart';
import 'package:tema6_weather/data/location_api.dart';
import 'package:tema6_weather/data/weather_api.dart';
import 'package:tema6_weather/models/index.dart';

class AppEpics {
  AppEpics({required LocationApi locationApi, required WeatherApi weatherApi})
      : _locationApi = locationApi,
        _weatherApi = weatherApi;

  final LocationApi _locationApi;
  final WeatherApi _weatherApi;

  Epic<AppState> get epics {
    return combineEpics<AppState>(<Epic<AppState>>[
      TypedEpic<AppState, GetLocationStart>(_getLocation),
      TypedEpic<AppState, GetWeatherStart>(_getWeather),
    ]);
  }

  Stream<AppAction> _getLocation(Stream<GetLocationStart> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((GetLocationStart action) => _locationApi.getLocation())
        .expand((Location location) {
      return <AppAction>[
        GetLocation.successful(location),
        const GetWeatherStart(),
      ];
    }).onErrorReturnWith((Object error, StackTrace stackTrace) => GetLocation.error(error, stackTrace));
  }

  Stream<AppAction> _getWeather(Stream<GetWeatherStart> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((GetWeatherStart action) => _weatherApi.getWeather(store.state.location!.city))
        .map((Weather weather) => GetWeather.successful(weather))
        .onErrorReturnWith((Object error, StackTrace stackTrace) => GetWeather.error(error, stackTrace));
  }
}
