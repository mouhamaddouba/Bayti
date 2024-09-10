import 'package:bayti/source/features/dashboard_notification/presentation/logic/dashboard_notification_controller.dart';
import 'package:get/get.dart';

class DashboardNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DashboardNotificationController(),
    );
  }
}
