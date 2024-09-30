import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/core/values/app_hero.dart';
import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/features/dashboard_real_estate/presentation/logic/dashboard_real_estate_controller.dart';
import 'package:bayti/source/features/dashboard_real_estate/presentation/logic/dashboard_real_estate_event.dart';
import 'package:bayti/source/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RealEstatFloatButtonView extends GetView<DashboardRealEstateController> {
  const RealEstatFloatButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: controller.animation,
      child: FloatingActionButton.extended(
        heroTag: AppHero.floatButton,
        backgroundColor: AppColors.white01,
        onPressed: () {
          controller.on(event: ToNewRealEstateEvent());
        },
        label: AppTextWidget(
          AppConstants.isAdmin
              ? AppStrings.addNewRealEstate.tr
              : AppStrings.addNewRealEstateRequest.tr,
          textColor: AppColors.primary,
          fontSize: AppDimensions.fontSize08,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
