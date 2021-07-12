
import 'package:tema6_weather/models/app_state.dart';
import 'package:tema6_weather/models/location.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';


class LocationContainer extends StatelessWidget {
  const LocationContainer({Key? key, required this.builder}) : super(key: key);

  final ViewModelBuilder<Location?> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Location?>(
      builder: builder,
      converter: (Store<AppState> store) {
        return store.state.location;
      },
    );
  }
}
