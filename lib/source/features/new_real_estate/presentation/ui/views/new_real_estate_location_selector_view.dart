import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_controller.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_event.dart';
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
          items: controller.state().cityName,
          controller: controller.state().cityDropDownController,
          hintText: AppStrings.cityDropDownHint.tr,
          onChanged: (city) {
            controller.on(
              event: NewRealEstateEvent.selectCity(
                city: city,
              ),
            );
          },
        ),

        /// Region
        Obx(
          () {
            return controller.state().isFetchRegion
                ? const SizedBox.shrink()
                : Builder(
                    builder: (context) {
                      if (!controller.state().regionData.contains(
                          controller.state().regionDropDownController.text)) {
                        controller.state().regionDropDownController.text =
                            AppConstants.emptyText;
                      }
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (!controller.state().regionData.contains(
                            controller.state().regionDropDownController.text)) {
                          controller.state().regionDropDownController.text =
                              AppStrings.regionDropDownHint.tr;
                        }
                      });

                      return CustomDropdown(
                        items: controller.state().regionData,
                        controller: controller.state().regionDropDownController,
                        hintText: AppStrings.regionDropDownHint.tr,
                        onChanged: (region) {
                          controller.on(
                            event: NewRealEstateEvent.selectRegion(
                              region: region,
                            ),
                          );
                        },
                      );
                    },
                  );
          },
        ),
      ],
    );
  }
}
