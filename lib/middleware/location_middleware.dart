import 'package:redux/redux.dart';
import 'package:tema6_weather/actions/get_location.dart';
import 'package:tema6_weather/actions/get_weather.dart';
import 'package:tema6_weather/data/location_api.dart';
import 'package:tema6_weather/data/weather_api.dart';
import 'package:tema6_weather/models/app_state.dart';
import 'package:tema6_weather/models/location.dart';
import 'package:tema6_weather/models/weather.dart';

class AppMiddleware {
  AppMiddleware({required LocationApi locationApi, required WeatherApi weatherApi})
      : _locationApi = locationApi,
        _weatherApi = weatherApi;

  final LocationApi _locationApi;
  final WeatherApi _weatherApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, GetLocation>(_getLocation),
      TypedMiddleware<AppState, GetWeather>(_getWeather),
    ];
  }

  Future<void> _getLocation(Store<AppState> store, GetLocation action, NextDispatcher next) async {
    next(action);
    try {
      final Location location = await _locationApi.getLocation();
      store.dispatch(GetLocationSuccessful(location));
    } catch (error) {
      store.dispatch(GetLocationError(error));
    }
  }

  Future<void> _getWeather(Store<AppState> store, GetWeather action, NextDispatcher next) async {
    next(action);
    try {
      final Weather weather =
          await _weatherApi.getWeather(store.state.location != null ? store.state.location!.city : 'Bucharest');
      store.dispatch(GetWeatherSuccessful(weather));
    } catch (error) {
      store.dispatch(GetWeatherError(error));
    }
  }
}
