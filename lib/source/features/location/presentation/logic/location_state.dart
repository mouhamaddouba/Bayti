import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationState {
  final Completer<GoogleMapController> completerController;
  final Set<Marker> markers;
  final bool isMyLocationEnabled;
  final Completer completer;

  LocationState({
    required this.completerController,
    required this.markers,
    required this.isMyLocationEnabled,
    required this.completer,
  });

  LocationState.defaultObj()
      : this(
          completerController: Completer<GoogleMapController>(),
          markers: {},
          isMyLocationEnabled: false,
          completer: Completer(),
        );

  LocationState copyWith({
    Completer<GoogleMapController>? completerController,
    Set<Marker>? markers,
    bool? isMyLocationEnabled,
    Completer? completer,
  }) =>
      LocationState(
        completerController: completerController ?? this.completerController,
        markers: markers ?? this.markers,
        isMyLocationEnabled: isMyLocationEnabled ?? this.isMyLocationEnabled,
        completer: completer ?? this.completer,
      );
}
