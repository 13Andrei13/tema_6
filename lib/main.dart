import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:tema6_weather/actions/get_location.dart';
import 'package:tema6_weather/data/location_api.dart';
import 'package:tema6_weather/middleware/location_middleware.dart';
import 'package:tema6_weather/models/app_state.dart';
import 'package:tema6_weather/presentation/home_page.dart';
import 'package:tema6_weather/reducer/reducer.dart';

void main() {
  const String apiUrl = 'http://ip-api.com/json/24.48.0.1';

  final Client client = Client();

  final LocationApi locationApi = LocationApi(apiUrl: apiUrl, client: client);

  final AppMiddleware appMiddleware = AppMiddleware(locationApi: locationApi);

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
