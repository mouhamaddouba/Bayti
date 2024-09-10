import 'package:bayti/source/features/dashboard_favorite/presentation/logic/dashboard_favorite_controller.dart';
import 'package:get/get.dart';

class DashboardFavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DashboardFavoriteController(),
    );
  }
}
