// ignore_for_file: unnecessary_overrides

import 'package:bayti/source/features/dashboard/presentation/logic/dashboard_state.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  ///region State
  final state = DashboardState.defaultObj().obs;

  DashboardController();

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

  ///endregion Public functions

  ///region Private functions

  ///region Private functions for dealing with events

  ///endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

  ///endregion Private functions
}
