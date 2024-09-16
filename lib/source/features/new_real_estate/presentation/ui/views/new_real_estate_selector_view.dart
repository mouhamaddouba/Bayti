import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/core/values/enums/data_real_estate_enum.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_controller.dart';
import 'package:bayti/source/features/new_real_estate/presentation/ui/views/widgets/list_selector_widget.dart';
import 'package:bayti/source/global_widgets/app_text_field_widget.dart';
import 'package:bayti/source/global_widgets/custom_drop_down/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewRealEstateSelectorView extends GetView<NewRealEstateController> {
  const NewRealEstateSelectorView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Type of transaction
        ListSelectorWidget(
          title: AppStrings.typeOfTransactionTitle.tr,
          items: DataRealEstateEnum().typeOfTransactionData,
          groupValue: controller.state().typeOfTransactionValue,
          onChanged: (value) {},
        ),

        /// Home direction
        ListSelectorWidget(
          title: AppStrings.homeDirectionTitle.tr,
          items: DataRealEstateEnum().homeDirectionData,
          groupValue: controller.state().homeDirectionValue,
          onChanged: (value) {},
        ),

        /// Type of Real estat
        ListSelectorWidget(
          title: AppStrings.typeOfRealEstateTitle.tr,
          items: DataRealEstateEnum().typeOfRealEstate,
          groupValue: controller.state().typeOfRealEstateValue,
          onChanged: (value) {},
        ),

        /// Record Number Mahdar
        Obx(
          () => controller.state().showTextField == true
              ? AppTextFieldWidget(
                  labelText: AppStrings.recordNumberLabel.tr,
                  controller: controller.state().recordNumberFieldController,
                  hintText: AppStrings.recordNumberHint.tr,
                  keyboardType: TextInputType.number,
                )
              : const SizedBox.shrink(),
        ),

        controller.state().showSelector == true
            ? Column(
                children: [
                  Row(
                    children: [
                      /// Rooms
                      Expanded(
                        child: CustomDropdown(
                          items: DataRealEstateEnum().numberOfRoomData,
                          controller:
                              controller.state().roomsDropDownController,
                          hintText: AppStrings.numberOfRoomTitle.tr,
                          onChanged: (rooms) {},
                        ),
                      ),

                      /// Floor
                      Expanded(
                        child: CustomDropdown(
                          items: DataRealEstateEnum().floorData,
                          controller:
                              controller.state().floorDropDownController,
                          hintText: AppStrings.floorTitle.tr,
                          onChanged: (floor) {},
                        ),
                      ),
                    ],
                  ),

                  /// Cladding
                  ListSelectorWidget(
                    title: AppStrings.houseCladdingTitle.tr,
                    items: DataRealEstateEnum().houseCladdingData,
                    groupValue: controller.state().houseCladdingValue,
                    onChanged: (value) {},
                  ),

                  /// House building
                  ListSelectorWidget(
                    title: AppStrings.houseBuildingTitle.tr,
                    items: DataRealEstateEnum().houseBuildingData,
                    groupValue: controller.state().houseBuildingValue,
                    onChanged: (value) {},
                  )
                ],
              )
            : const SizedBox.shrink(),

        /// Void type
        Padding(
          padding: const EdgeInsetsDirectional.only(
            bottom: AppDimensions.paddingOrMargin8,
          ),
          child: ListSelectorWidget(
            title: AppStrings.voidTypeTitle.tr,
            items: DataRealEstateEnum().voidTypeData,
            groupValue: controller.state().voidTypeValue,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
