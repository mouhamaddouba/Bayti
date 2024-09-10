import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/core/values/enums/dashboard_items_enum.dart';
import 'package:bayti/source/features/dashboard/presentation/logic/dashboard_controller.dart';
import 'package:bayti/source/global_widgets/app_bottom_bar_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DashboardTabBarView extends GetView<DashboardController> {
  const DashboardTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          height: AppDimensions.height60,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: AppColors.surfaceVariant,
                offset: Offset(
                  AppDimensions.zero,
                  AppDimensions.zero,
                ),
                spreadRadius: AppDimensions.zero,
                blurRadius: AppConstants.blur03,
              ),
            ],
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(
                AppDimensions.radius16,
              ),
            ),
          ),
          child: AppBottomBarWidget(
            items: AppConstants.isAdmin
                ? DashboardItemsEnum().adminDashboardItems
                : DashboardItemsEnum().customerDashboardItems,
            selectedIndex: controller.state().selectedIndex,
            onTap: (int index) {
              controller.state(
                controller.state().copyWith(
                      selectedIndex: index,
                    ),
              );
            },
            isBottomIndicator: false,
          ),
        );
      },
    );
  }
}
