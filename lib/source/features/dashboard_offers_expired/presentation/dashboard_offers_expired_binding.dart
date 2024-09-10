import 'package:bayti/source/features/dashboard_offers_expired/presentation/logic/dashboard_offers_expired_controller.dart';
import 'package:get/get.dart';

class DashboardOffersExpiredBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DashboardOffersExpiredController(),
    );
  }
}
