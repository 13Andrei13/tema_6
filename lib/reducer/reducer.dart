import 'package:redux/redux.dart';
import 'package:tema6_weather/actions/get_location.dart';
import 'package:tema6_weather/actions/get_weather.dart';
import 'package:tema6_weather/models/app_state.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  (AppState state, dynamic action) {
    return state;
  },
  TypedReducer<AppState, GetLocationSuccessful>(_getLocationSuccessful),
  TypedReducer<AppState, GetWeatherSuccessful>(_getWeatherSuccessful),
  //TypedReducer<AppState, GetLocationError>(_getLocationError),
  //TypedReducer<AppState, GetLocation>(_getLocation),
]);

AppState _getLocationSuccessful(AppState state, GetLocationSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b.location = action.location.toBuilder();
  });
}

/*
  AppState _getLocationError(AppState state, GetLocationError action) {
    return state.rebuild((AppStateBuilder b) {
      b.error = action.error.toString();
    });
  }
  */

// AppState _getLocation(AppState state, GetLocation action) {}

AppState _getWeatherSuccessful(AppState state, GetWeatherSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b.weather = action.weather.toBuilder();
  });
}
