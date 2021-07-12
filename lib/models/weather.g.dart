// GENERATED CODE - DO NOT MODIFY BY HAND

part of weather;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Weather> _$weatherSerializer = new _$WeatherSerializer();

class _$WeatherSerializer implements StructuredSerializer<Weather> {
  @override
  final Iterable<Type> types = const [Weather, _$Weather];
  @override
  final String wireName = 'Weather';

  @override
  Iterable<Object?> serialize(Serializers serializers, Weather object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'temp_c',
      serializers.serialize(object.temp, specifiedType: const FullType(double)),
      'last_updated',
      serializers.serialize(object.update,
          specifiedType: const FullType(String)),
      'wind_kph',
      serializers.serialize(object.wind, specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  Weather deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'temp_c':
          result.temp = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'last_updated':
          result.update = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wind_kph':
          result.wind = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$Weather extends Weather {
  @override
  final double temp;
  @override
  final String update;
  @override
  final double wind;

  factory _$Weather([void Function(WeatherBuilder)? updates]) =>
      (new WeatherBuilder()..update(updates)).build();

  _$Weather._({required this.temp, required this.update, required this.wind})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(temp, 'Weather', 'temp');
    BuiltValueNullFieldError.checkNotNull(update, 'Weather', 'update');
    BuiltValueNullFieldError.checkNotNull(wind, 'Weather', 'wind');
  }

  @override
  Weather rebuild(void Function(WeatherBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherBuilder toBuilder() => new WeatherBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Weather &&
        temp == other.temp &&
        update == other.update &&
        wind == other.wind;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, temp.hashCode), update.hashCode), wind.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Weather')
          ..add('temp', temp)
          ..add('update', update)
          ..add('wind', wind))
        .toString();
  }
}

class WeatherBuilder implements Builder<Weather, WeatherBuilder> {
  _$Weather? _$v;

  double? _temp;
  double? get temp => _$this._temp;
  set temp(double? temp) => _$this._temp = temp;

  String? _update;
  String? get update => _$this._update;
  set update(String? update) => _$this._update = update;

  double? _wind;
  double? get wind => _$this._wind;
  set wind(double? wind) => _$this._wind = wind;

  WeatherBuilder();

  WeatherBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _temp = $v.temp;
      _update = $v.update;
      _wind = $v.wind;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Weather other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Weather;
  }

  @override
  void update(void Function(WeatherBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Weather build() {
    final _$result = _$v ??
        new _$Weather._(
            temp:
                BuiltValueNullFieldError.checkNotNull(temp, 'Weather', 'temp'),
            update: BuiltValueNullFieldError.checkNotNull(
                update, 'Weather', 'update'),
            wind:
                BuiltValueNullFieldError.checkNotNull(wind, 'Weather', 'wind'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
