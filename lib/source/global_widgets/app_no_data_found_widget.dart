import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:flutter/material.dart';

import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/global_widgets/app_text_widget.dart';
import 'package:bayti/source/global_widgets/app_image_widget.dart';
import 'package:get/get.dart';

class AppNoDataFoundWidget extends StatelessWidget {
  final double? widthImage;
  final double? space;
  final String title;
  final String path;
  final MainAxisAlignment? mainAxisAlignment;

  const AppNoDataFoundWidget({
    super.key,
    this.widthImage,
    this.space,
    required this.title,
    required this.path,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        /// Image
        AppImageWidget(
          path: path,
          width: widthImage ?? AppDimensions.width300,
        ),

        /// Space
        SizedBox(
          height: space ?? AppDimensions.height20,
        ),

        /// Title
        AppTextWidget(
          title.tr,
          fontSize: AppDimensions.fontSize14,
          textColor: AppColors.black01.withOpacity(
            AppConstants.opacity_06,
          ),
        ),
      ],
    );
  }
}
