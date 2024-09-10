// ignore_for_file: unnecessary_overrides

import 'package:bayti/source/core/values/constants/app_arguments_keys.dart';
import 'package:bayti/source/core/values/export/export_values.dart';
import 'package:bayti/source/features/dashboard_real_estate/presentation/logic/dashboard_real_estate_event.dart';
import 'package:bayti/source/features/dashboard_real_estate/presentation/logic/dashboard_real_estate_state.dart';
import 'package:bayti/source/routes/app_pages.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class DashboardRealEstateController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ///region State

  final state = DashboardRealEstateState.defaultObj().obs;

  ///endregion State

  ///region Use Cases

  ///endregion Use Cases

  ///region Constructors

  late Animation<double> animation;
  late AnimationController animationController;

  Animation<double> get animationFloat => animation;

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

    on(
      event: DashboardRealEstateEvent.animateFloatButton(),
    );
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
    required DashboardRealEstateEvent event,
  }) {
    if (event is AnimateFloatButtonEvent) {
      _animateFloatButtonEvent(
        event: event,
      );
    } else if (event is ToNewRealEstateEvent) {
      _toNewRealEstateEvent(
        event: event,
      );
    } else if (event is ToListCategoriesEvent) {
      _toListCategoriesEvent(
        event: event,
      );
    }
  }

  ///endregion Public functions

  ///region Private functions

  /// Animate the floating button
  void _animateFloatButtonEvent({
    required AnimateFloatButtonEvent event,
  }) async {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: AppConstants.duration500,
      ),
    );

    final Animation<double> curve = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    animation = Tween(
      begin: AppConstants.tween0_9,
      end: AppConstants.tween1_1,
    ).animate(curve);

    animationController.repeat(
      reverse: true,
    );
  }

  /// Move to add new real estate by floating button
  void _toNewRealEstateEvent({
    required ToNewRealEstateEvent event,
  }) {
    Get.toNamed(
      AppRoutes.newRealEstate,
    );
  }

  /// Move to list real estate by type real estate
  void _toListCategoriesEvent({
    required ToListCategoriesEvent event,
  }) async {
    Get.toNamed(
      AppRoutes.listRealEstate,
      arguments: {
        AppArgumentsKeys.realEstat: event.categories,
      },
    );
  }

  ///region Private functions for dealing with events

  ///endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

  ///endregion Private functions
}
