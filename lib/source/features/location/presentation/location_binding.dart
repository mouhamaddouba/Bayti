import 'package:bayti/source/features/location/presentation/logic/location_controller.dart';
import 'package:get/get.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LocationController(),
    );
  }
}
