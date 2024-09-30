import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_controller.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_event.dart';
import 'package:bayti/source/global_widgets/app_icon_widget.dart';
import 'package:bayti/source/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewRealEstateAppBarView extends GetView<NewRealEstateController> {
  const NewRealEstateAppBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: AppDimensions.paddingOrMargin16,
        end: AppDimensions.paddingOrMargin16,
        top: AppDimensions.paddingOrMargin44,
        bottom: AppDimensions.paddingOrMargin8,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Icon back
            AppIconWidget(
              containerColor: AppColors.onPrimary,
              iconData: Icons.arrow_back_ios_rounded,
              color: Theme.of(context).primaryColor,
              withBackground: true,
              backgroundRadius: AppDimensions.radius10,
              backgroundSize: AppDimensions.iconSize38,
              size: AppDimensions.iconSize26,
              onTap: () {
                controller.on(
                  event: BackToListCategoriesEvent(),
                );
              },
            ),

            /// Title Appbar
            AppTextWidget(
              AppConstants.isAdmin
                  ? AppStrings.addNewRealEstate.tr
                  : AppStrings.addNewRealEstateRequest.tr,
              textColor: AppColors.black01,
              fontSize: AppDimensions.fontSize12,
            ),

            /// Location
            AppConstants.isAdmin
                ? Obx(
                    () {
                      return AppIconWidget(
                        onTap: () {
                          controller.on(
                            event: PickLocationEvent(),
                          );
                        },
                        withBackground: true,
                        containerColor: AppColors.onPrimary,
                        iconData: Icons.my_location_outlined,
                        backgroundRadius: AppDimensions.radius10,
                        backgroundSize: AppDimensions.iconSize40,
                        color: controller.state().isSaveButtonPress
                            ? AppColors.successLight
                            : AppColors.gray03,
                      );
                    },
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
