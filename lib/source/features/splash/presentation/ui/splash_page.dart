import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/core/values/constants/app_assets.dart';
import 'package:bayti/source/features/splash/presentation/logic/splash_controller.dart';
import 'package:bayti/source/global_widgets/app_image_widget.dart';
import 'package:bayti/source/global_widgets/app_loading_widget.dart';
import 'package:bayti/source/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Logo
          const Padding(
            padding: EdgeInsets.only(
              top: AppDimensions.paddingOrMargin200,
              left: AppDimensions.paddingOrMargin100,
              right: AppDimensions.paddingOrMargin100,
            ),
            child: AppImageWidget(
              path: AppAssets.logoAdmin,
              isCircle: true,
              width: AppDimensions.width150,
            ),
          ),

          /// Spacing
          const Spacer(),

          /// Name with loading
          Padding(
            padding: const EdgeInsets.only(
              bottom: AppDimensions.paddingOrMargin50,
            ),
            child: Column(
              children: [
                /// Text splash
                AppTextWidget(
                  AppStrings.realEstateService.tr,
                  fontSize: AppDimensions.fontSize14.sp,
                  textColor: AppColors.black01,
                ),

                /// Progress
                const AppLoadingWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
