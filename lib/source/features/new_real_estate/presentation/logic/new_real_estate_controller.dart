// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_event.dart';
import 'package:bayti/source/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NewRealEstateController extends GetxController {
  ///region State

  final state = NewRealEstateState.defaultObj().obs;

  ///endregion State

  ///region Use Cases

  ///endregion Use Cases

  ///region Constructors

  NewRealEstateController();

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

  void on({
    required NewRealEstateEvent event,
  }) {
    if (event is BackToListCategoriesEvent) {
      _backToListCategoriesEvent(
        event: event,
      );
    } else if (event is PickLocationEvent) {
      _pickLocationEvent(
        event: event,
      );
    }
  }

  ///endregion Public functions

  ///region Private functions

  /// Back to real estate page
  void _backToListCategoriesEvent({
    required BackToListCategoriesEvent event,
  }) {
    Get.back();
  }

  /// Pick location [long , lat]
  void _pickLocationEvent({
    required PickLocationEvent event,
  }) async {
    final LatLng? selectedPosition = await Get.toNamed(
      AppRoutes.location,
    ) as LatLng?;

    if (selectedPosition != null) {
      state(
        state().copyWith(
          isSaveButtonPress: true,
        ),
      );
    }

    state(
      state().copyWith(
        latitudeValue: selectedPosition?.latitude,
        longitudeValue: selectedPosition?.longitude,
        location: selectedPosition,
      ),
    );
  }

  ///region Private functions for dealing with events

  ///endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

  ///endregion Private functions
}
