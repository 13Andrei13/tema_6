import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tema6_weather/container/location_container.dart';
import 'package:tema6_weather/container/weather_container.dart';
import 'package:tema6_weather/models/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocationContainer(builder: (BuildContext context, Location? location) {
      return Scaffold(
        appBar: AppBar(
          title: Text(location != null ? location.city : 'No Data'),
        ),
        body: Column(
          children: <Widget>[
            WeatherContainer(builder: (BuildContext context, Weather? weather) {
              return Text('temperature ${weather != null ? weather.temp : "No Data"}');
            }),
            // Text('lon ${location.lon}'),
          ],
        ),
      );
    });
  }
}
