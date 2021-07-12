library weather;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tema6_weather/models/serializers.dart';

part 'weather.g.dart';

abstract class Weather implements Built<Weather, WeatherBuilder> {
  factory Weather([void Function(WeatherBuilder b) updates]) = _$Weather;
  factory Weather.fromJson(dynamic json) => serializers.deserializeWith(serializer, json)!;

  Weather._();

  @BuiltValueField(wireName: 'temp_c')
  double get temp;

  @BuiltValueField(wireName: 'last_updated')
  String get updated;

  //Map<String, dynamic> get condition;

  @BuiltValueField(wireName: 'wind_kph')
  double get wind;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<Weather> get serializer => _$weatherSerializer;
}
