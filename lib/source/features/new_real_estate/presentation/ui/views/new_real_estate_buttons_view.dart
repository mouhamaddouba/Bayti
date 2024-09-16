import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_controller.dart';
import 'package:bayti/source/global_widgets/app_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewRealEstateButtonsView extends GetView<NewRealEstateController> {
  const NewRealEstateButtonsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppDimensions.paddingOrMargin16,
        vertical: AppDimensions.paddingOrMargin16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /// Save
          AppButtonWidget(
            isBordered: true,
            width: AppDimensions.width140.sp,
            color: AppColors.primary,
            text: AppConstants.isAdmin
                ? AppStrings.save.tr
                : AppStrings.shareRequest.tr,
            onPressed: () {},
          ),

          /// Delete
          AppButtonWidget(
            isBordered: true,
            width: AppDimensions.width140.sp,
            color: AppColors.error,
            text: AppStrings.deleteAll.tr,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
