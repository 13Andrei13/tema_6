import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:tema6_weather/models/app_state.dart';
import 'package:tema6_weather/models/location.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  AppState,
  Location,
])
Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
