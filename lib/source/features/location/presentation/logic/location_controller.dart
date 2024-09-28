// ignore_for_file: unnecessary_overrides

import 'package:bayti/source/core/utils/app_alert_utils.dart';
import 'package:bayti/source/core/values/export/export_values.dart';
import 'package:bayti/source/features/location/presentation/logic/location_event.dart';
import 'package:bayti/source/features/location/presentation/logic/location_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  ///region State

  final state = LocationState.defaultObj().obs;

  ///endregion State

  ///region Use Cases

  ///endregion Use Cases

  ///region Constructors

  ///endregion Constructors

  ///region Lifecycle

  @override
  InternalFinalCallback<void> get onStart {
    return super.onStart;
  }

  @override
  void onInit() {
    super.onInit();

    _workers();
    _processArguments();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    return super.onDelete;
  }

  ///endregion Lifecycle

  ///region Public functions

  Future<void> on({
    required LocationEvent event,
  }) async {
    if (event is SetLocationEvent) {
      _setLocationEvent(
        event: event,
      );
    } else if (event is GetUserLocationEvent) {
      _getUserLocationEvent(
        event: event,
      );
    } else if (event is AnimateCameraToPositionEvent) {
      _animateCameraToPositionEvent(
        event: event,
      );
    } else if (event is GetLocationEvent) {
      _getLocationEvent(
        event: event,
      );
    }
  }

  ///endregion Public functions

  ///region Private functions

  /// Set marker where i selected before
  Future<void> _setLocationEvent({
    required SetLocationEvent event,
  }) async {
    GoogleMapController googleMapController =
        await state().completerController.future;
    LatLngBounds latLngBounds = await googleMapController.getVisibleRegion();

    double lat =
        (latLngBounds.northeast.latitude + latLngBounds.southwest.latitude) /
            2.0;
    double lon =
        (latLngBounds.northeast.longitude + latLngBounds.southwest.longitude) /
            2.0;

    // Close the current page and return the LatLng result
    Get.back(
      result: LatLng(lat, lon),
    );

    // Show a success dialog
    AppAlertUtils.showSnackBar(
      title: AppStrings.success.tr,
      message: AppStrings.donePick.tr,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.primary,
      durationSeconds: AppConstants.duration03,
    );
  }

  /// Get User Location
  Future<void> _getUserLocationEvent({
    required GetUserLocationEvent event,
  }) async {
    try {
      Position position = await _getLocationEvent(
        event: GetLocationEvent(),
      );

      _animateCameraToPositionEvent(
        event: AnimateCameraToPositionEvent(
          target: LatLng(
            position.latitude,
            position.longitude,
          ),
        ),
      );

      state(
        state().copyWith(
          isMyLocationEnabled: state().isMyLocationEnabled,
        ),
      );
      update();
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    }
  }

  /// animates camera to the matched library name
  Future<void> _animateCameraToPositionEvent({
    required AnimateCameraToPositionEvent event,
  }) async {
    CameraPosition cameraPosition = CameraPosition(
      target: event.target,
      zoom: AppConstants.zoomCamera,
    );
    CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(cameraPosition);
    GoogleMapController controller = await state().completer.future;
    controller.animateCamera(
      cameraUpdate,
    );
  }

  /// Get location of user from map
  Future<Position> _getLocationEvent({
    required GetLocationEvent event,
  }) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      /// Location services are not enabled
      AppAlertUtils.showSnackBar(
        title: AppConstants.emptyText,
        snackPosition: SnackPosition.BOTTOM,
        message: AppStrings.locationDisabled.tr,
        durationSeconds: AppConstants.duration01,
        backgroundColor: Theme.of(Get.context!).colorScheme.secondary,
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        /// Permissions are denied
        AppAlertUtils.showSnackBar(
          title: AppConstants.emptyText,
          snackPosition: SnackPosition.BOTTOM,
          durationSeconds: AppConstants.duration01,
          message: AppStrings.locationPermissionReason.tr,
          backgroundColor: Theme.of(Get.context!).colorScheme.secondary,
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      /// Permissions are denied forever, handle appropriately.
      AppAlertUtils.showSnackBar(
        title: AppConstants.emptyText,
        snackPosition: SnackPosition.BOTTOM,
        durationSeconds: AppConstants.duration01,
        message: AppStrings.locationPermissionReasonRequest.tr,
        backgroundColor: Theme.of(Get.context!).colorScheme.secondary,
      );
    }

    return await Geolocator.getCurrentPosition();
  }

  ///region Private functions for dealing with events

  ///endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

  ///endregion Private functions
}
