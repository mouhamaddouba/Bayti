import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LocationEvent {
  /// No Params
  factory LocationEvent.setLocation() = SetLocationEvent;

  factory LocationEvent.getUserLocation() = GetUserLocationEvent;

  factory LocationEvent.getLocation() = GetLocationEvent;

  /// With Params
  factory LocationEvent.animateCameraToPosition({
    required LatLng target,
  }) = AnimateCameraToPositionEvent;
}

/// No Params
class SetLocationEvent implements LocationEvent {
  SetLocationEvent();
}

class GetUserLocationEvent implements LocationEvent {
  GetUserLocationEvent();
}

class GetLocationEvent implements LocationEvent {
  GetLocationEvent();
}

/// With Params
class AnimateCameraToPositionEvent implements LocationEvent {
  final LatLng target;

  AnimateCameraToPositionEvent({
    required this.target,
  });
}
