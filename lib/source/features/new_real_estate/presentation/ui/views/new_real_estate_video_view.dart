import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_controller.dart';
import 'package:bayti/source/global_widgets/app_icon_widget.dart';
import 'package:bayti/source/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewRealEstateVideoView extends GetView<NewRealEstateController> {
  const NewRealEstateVideoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        bottom: AppDimensions.paddingOrMargin16,
        start: AppDimensions.paddingOrMargin4,
      ),
      child: Column(
        children: [
          /// Title of video
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: AppDimensions.paddingOrMargin16,
              end: AppDimensions.paddingOrMargin16,
              bottom: AppDimensions.paddingOrMargin20,
            ),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: AppTextWidget(
                AppStrings.video.tr,
                textColor: AppColors.black01,
                fontSize: AppDimensions.fontSize09.sp,
              ),
            ),
          ),

          (controller.state().videoThumbnail.isNotEmpty)

              // images video that i selected
              ? Column(
                  children: [
                    SizedBox(
                      height: 140,
                      width: 140,
                      child: Image.memory(
                        controller.state().videoThumbnail,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ],
                )

              // No select video
              : Center(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        /// Icon thumbnail video
                        const AppIconWidget(
                          iconData: Icons.video_camera_back_outlined,
                          color: AppColors.gray03,
                          size: AppDimensions.iconSize40,
                        ),

                        /// Space
                        const SizedBox(
                          height: AppDimensions.paddingOrMargin8,
                        ),

                        /// Title no video
                        AppTextWidget(
                          AppStrings.addVideoMax.tr,
                          fontSize: AppDimensions.fontSize08.sp,
                          textColor: AppColors.gray03,
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
