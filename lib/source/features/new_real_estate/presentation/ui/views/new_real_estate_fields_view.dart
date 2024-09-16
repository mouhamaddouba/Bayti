import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_controller.dart';
import 'package:bayti/source/global_widgets/app_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NewRealEstateFieldsView extends GetView<NewRealEstateController> {
  const NewRealEstateFieldsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Price
        AppTextFieldWidget(
          keyboardType: TextInputType.number,
          hintText: AppStrings.priceFieldHint.tr,
          labelText: AppStrings.priceFieldLabel.tr,
          controller: controller.state().priceFieldController,
        ),

        /// Space
        AppTextFieldWidget(
          keyboardType: TextInputType.number,
          hintText: AppStrings.spaceFieldHint.tr,
          labelText: AppStrings.spaceFieldLabel.tr,
          controller: controller.state().spaceFieldController,
        ),

        /// Phone number
        AppTextFieldWidget(
          keyboardType: TextInputType.number,
          hintText: AppStrings.phoneFieldHint.tr,
          labelText: AppStrings.phoneFieldLabel.tr,
          controller: controller.state().phoneFieldController,
          inputFormatters: [
            LengthLimitingTextInputFormatter(12),
            FilteringTextInputFormatter.allow(RegExp(r'\d')),
          ],
        ),

        /// Details real estat
        AppTextFieldWidget(
          maxLenght: 255,
          keyboardType: TextInputType.text,
          hintText: AppStrings.detailsFieldHint.tr,
          labelText: AppStrings.detailsFieldLabel.tr,
          controller: controller.state().detailsFieldController,
        ),

        AppConstants.isAdmin
            ? Column(
                children: [
                  /// From Date
                  AppTextFieldWidget(
                    maxLenght: 255,
                    keyboardType: TextInputType.text,
                    hintText: AppStrings.detailsFieldHint.tr,
                    labelText: AppStrings.detailsFieldLabel.tr,
                    controller: controller.state().detailsFieldController,
                  ),

                  /// To Date
                  AppTextFieldWidget(
                    maxLenght: 255,
                    keyboardType: TextInputType.text,
                    hintText: AppStrings.detailsFieldHint.tr,
                    labelText: AppStrings.detailsFieldLabel.tr,
                    controller: controller.state().detailsFieldController,
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
