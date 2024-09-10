import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/core/values/enums/real_estate_type_enum.dart';
import 'package:bayti/source/features/dashboard_real_estate/presentation/logic/dashboard_real_estate_controller.dart';
import 'package:bayti/source/features/dashboard_real_estate/presentation/logic/dashboard_real_estate_event.dart';
import 'package:bayti/source/features/dashboard_real_estate/presentation/ui/views/real_estat_float_button_view.dart';
import 'package:bayti/source/global_widgets/app_image_widget.dart';
import 'package:bayti/source/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

class DashboardRealEstatePage extends GetView<DashboardRealEstateController> {
  const DashboardRealEstatePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Floating button
      floatingActionButton: const RealEstatFloatButtonView(),

      /// Body
      body: AnimationLimiter(
        child: GridView.count(
          padding: const EdgeInsetsDirectional.only(
            start: AppDimensions.paddingOrMargin10,
            end: AppDimensions.paddingOrMargin10,
            top: AppDimensions.paddingOrMargin60,
          ),
          crossAxisCount: AppConstants.cross02,
          children: List.generate(
            RealEstateTypeEnum().titleRealEstat.length,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(
                  milliseconds: AppConstants.duration800,
                ),
                columnCount: AppConstants.cross02,
                child: ScaleAnimation(
                  duration: const Duration(
                    milliseconds: AppConstants.duration1200,
                  ),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: AppDimensions.paddingOrMargin14,
                        left: AppDimensions.paddingOrMargin8,
                        right: AppDimensions.paddingOrMargin6,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radius16,
                        ),
                        child: GridTile(
                          /// Title type real estate
                          footer: GridTileBar(
                            backgroundColor: Colors.black26,
                            title: AppTextWidget(
                              RealEstateTypeEnum().titleRealEstat[index],
                              fontSize: AppDimensions.fontSize09.sp,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              controller.on(
                                event: ToListCategoriesEvent(
                                  categories: RealEstateTypeEnum()
                                      .titleRealEstat[index],
                                ),
                              );
                            },

                            /// Image type real estate
                            child: AppImageWidget(
                              path: RealEstateTypeEnum().imageRealEstat[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
