import 'package:bayti/source/features/dashboard/presentation/logic/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DashboardController(),
    );
  }
}
