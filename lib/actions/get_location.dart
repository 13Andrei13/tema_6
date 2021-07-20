import 'package:tema6_weather/actions/index.dart';
import 'package:tema6_weather/models/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_location.freezed.dart';

@freezed
class GetLocation with _$GetLocation implements AppAction {
  const factory GetLocation() = GetLocationStart;

  const factory GetLocation.successful(Location location) = GetLocationSuccessful;

  @Implements(ErrorAction)
  const factory GetLocation.error(Object error, StackTrace stackTrace) = GetLocationError;
}

/*class GetLocation {}

class GetLocationSuccessful {
  GetLocationSuccessful(this.location);

  final Location location;

  @override
  String toString() {
    return 'GetLocationSuccessful{location: $location}';
  }
}

class GetLocationError {
  GetLocationError(this.error);

  final Object error;

  @override
  String toString() {
    return 'GetLocationError{error: $error}';
  }
}
*/
