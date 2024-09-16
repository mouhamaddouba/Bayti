import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_controller.dart';
import 'package:bayti/source/global_widgets/app_icon_widget.dart';
import 'package:bayti/source/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewRealEstateImagesView extends GetView<NewRealEstateController> {
  const NewRealEstateImagesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingOrMargin6,
        vertical: AppDimensions.paddingOrMargin16,
      ),
      child: Container(
        child: controller.state().images.isEmpty

            // No Images selected
            ? Center(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      /// Icons
                      const AppIconWidget(
                        iconData: Icons.image_outlined,
                        color: AppColors.gray03,
                        size: AppDimensions.iconSize40,
                      ),

                      /// Space
                      const SizedBox(
                        height: AppDimensions.paddingOrMargin8,
                      ),

                      /// Title no images
                      AppTextWidget(
                        AppStrings.addImagesMax.tr,
                        fontSize: AppDimensions.fontSize08.sp,
                        textColor: AppColors.gray03,
                      ),
                    ],
                  ),
                ),
              )

            // List images that i selected
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.state().images.map<Widget>((image) {
                    return Padding(
                      padding: const EdgeInsets.all(
                        AppDimensions.paddingOrMargin4,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          /// Images
                          SizedBox(
                            height: AppDimensions.height120,
                            width: AppDimensions.width120,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  AppDimensions.paddingOrMargin10,
                                ),
                              ),
                              child: Image.file(
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          /// Remove images
                          Positioned(
                            top: -AppDimensions.paddingOrMargin6,
                            right: -AppDimensions.paddingOrMargin8,
                            child: InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.remove_circle_outline,
                                color: AppColors.red01,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList()
                    ..addAll(
                      [
                        /// Add new images
                        if (controller.state().images.length != 7)
                          SizedBox(
                            child: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  left: AppDimensions.paddingOrMargin10,
                                ),
                                child: AppIconWidget(
                                  iconData: Icons.add_circle_outline,
                                  color: AppColors.gray03,
                                  size: AppDimensions.iconSize36,
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                ),
              ),
      ),
    );
  }
}
