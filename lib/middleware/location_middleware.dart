import 'package:redux/redux.dart';
import 'package:tema6_weather/actions/get_location.dart';
import 'package:tema6_weather/data/location_api.dart';
import 'package:tema6_weather/models/app_state.dart';
import 'package:tema6_weather/models/location.dart';

class AppMiddleware {
  AppMiddleware({required LocationApi locationApi})
      : _locationApi = locationApi;

  final LocationApi _locationApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, GetLocation>(
          _getLocation), // AppState -> de unde raspunde si  GetMovies -> unde merge
    ];
  }

  Future<void> _getLocation(
      Store<AppState> store, GetLocation action, NextDispatcher next) async {
    next(action);
    try {
      final Location location = await _locationApi.getLocation();
      store.dispatch(GetLocationSuccessful(location));
    } catch (error) {
      store.dispatch(GetLocationError(error));
    }
  }
}
