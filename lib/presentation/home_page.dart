import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tema6_weather/container/location_container.dart';
import 'package:tema6_weather/container/weather_container.dart';
import 'package:tema6_weather/models/location.dart';
import 'package:tema6_weather/models/weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocationContainer(
        builder: (BuildContext context, Location? location) {
      return Scaffold(
        appBar: AppBar(
          title: Text(location!.city),
        ),
        body: Column(
          children: <Widget>[
            WeatherContainer(builder: (BuildContext context, Weather? weather) {
              return Text('lat ${weather!.temp}');
            }),
            Text('lon ${location.lon}'),
          ],
        ),
      );
    });
  }
}
