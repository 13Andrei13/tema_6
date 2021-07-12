import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:tema6_weather/actions/get_location.dart';
import 'package:tema6_weather/data/location_api.dart';
import 'package:tema6_weather/data/weather_api.dart';
import 'package:tema6_weather/middleware/location_middleware.dart';
import 'package:tema6_weather/models/app_state.dart';
import 'package:tema6_weather/presentation/home_page.dart';
import 'package:tema6_weather/reducer/reducer.dart';

void main() {
  const String apiUrlLocation = 'http://ip-api.com/json/24.48.0.1';

  const String apiUrlWeather =
      'http://api.weatherapi.com/v1/current.json?key=bee174576b854d7c929101501211207';

  final Client client = Client();

  final LocationApi locationApi =
      LocationApi(apiUrl: apiUrlLocation, client: client);

  final WeatherApi weatherApi =
      WeatherApi(apiUrl: apiUrlWeather, client: client);

  final AppMiddleware appMiddleware =
      AppMiddleware(locationApi: locationApi, weatherApi: weatherApi);

  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState(),
    middleware: appMiddleware.middleware,
  );

  store.dispatch(GetLocation());

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: const MaterialApp(
          home: HomePage(),
        ));
  }
}
