import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_controller.dart';
import 'package:bayti/source/global_widgets/custom_drop_down/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewRealEstateLocationSelectorView
    extends GetView<NewRealEstateController> {
  const NewRealEstateLocationSelectorView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// city
        CustomDropdown(
          // items: controller.state().cityData,
          items: const [''],
          controller: controller.state().cityDropDownController,
          hintText: AppStrings.cityDropDownHint.tr,
          onChanged: (city) {},
        ),

        /// Region
        controller.state().isFetchRegion
            ? const SizedBox.shrink()
            : Obx(
                () {
                  return CustomDropdown(
                    items: controller.state().regionData,
                    controller: controller.state().regionDropDownController,
                    hintText: AppStrings.regionDropDownHint.tr,
                    onChanged: (region) {},
                  );
                },
              ),
      ],
    );
  }
}
