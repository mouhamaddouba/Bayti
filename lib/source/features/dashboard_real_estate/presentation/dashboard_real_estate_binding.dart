import 'package:bayti/source/features/dashboard_real_estate/presentation/logic/dashboard_real_estate_controller.dart';
import 'package:get/get.dart';

class DashboardRealEstateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DashboardRealEstateController(),
    );
  }
}
