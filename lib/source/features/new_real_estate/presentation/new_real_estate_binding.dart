import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_controller.dart';
import 'package:get/get.dart';

class NewRealEstateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NewRealEstateController(),
    );
  }
}
