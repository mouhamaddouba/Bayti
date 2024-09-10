// ignore_for_file: unnecessary_overrides

import 'package:bayti/source/features/dashboard_offers_expired/presentation/logic/dashboard_offers_expired_state.dart';
import 'package:get/get.dart';

class DashboardOffersExpiredController extends GetxController {
  ///region State

  final state = DashboardOffersExpiredState.defaultObj().obs;

  ///endregion State

  ///region Use Cases

  ///endregion Use Cases

  ///region Constructors

  DashboardOffersExpiredController();

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

  ///endregion Public functions

  ///region Private functions

  ///region Private functions for dealing with events

  ///endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

  ///endregion Private functions
}
