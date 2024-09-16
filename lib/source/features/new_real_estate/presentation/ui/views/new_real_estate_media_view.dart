import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/core/values/export/export_values.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_controller.dart';
import 'package:bayti/source/features/new_real_estate/presentation/ui/views/new_real_estate_video_view.dart';
import 'package:bayti/source/features/new_real_estate/presentation/ui/views/new_real_estate_images_view.dart';
import 'package:bayti/source/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewRealEstateMediaView extends GetView<NewRealEstateController> {
  const NewRealEstateMediaView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Images
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingOrMargin16,
          ),
          child: Column(
            children: [
              /// Number of image
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: AppTextWidget(
                  '${AppStrings.images.tr} : ( ${controller.state().images.length} / 7 )',
                  textColor: AppColors.black01,
                  fontSize: AppDimensions.fontSize09.sp,
                ),
              ),

              /// Select image
              const NewRealEstateImagesView(),
            ],
          ),
        ),

        /// Videos
        const NewRealEstateVideoView(),
      ],
    );
  }
}
