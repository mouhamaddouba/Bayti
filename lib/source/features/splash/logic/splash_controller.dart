// ignore_for_file: unnecessary_overrides

import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/features/splash/logic/splash_event.dart';
import 'package:bayti/source/features/splash/logic/splash_state.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  /// region State

  final state = SplashState.defaultObj().obs;

  ///endregion State

  SplashController();

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
      event: SplashEvent.delayTimeout(),
    );
  }

  ///endregion Lifecycle

  ///region Public functions
  void on({
    required SplashEvent event,
  }) {
    if (event is DelayTimeoutEvent) {
      _delayTimeout(
        event: event,
      );
    }
  }

  //endregion Public functions

  //region Private functions

  //region Private functions for dealing with events

  /// Delay screen splash then navigation to dashboard
  void _delayTimeout({
    required DelayTimeoutEvent event,
  }) {
    Future.delayed(
      const Duration(
        seconds: AppConstants.duration01,
      ),
      () {
        // Get.offNamed(
        //   AppRoutes.dashboard,
        // );
      },
    );
  }

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

//endregion Private functions
}
