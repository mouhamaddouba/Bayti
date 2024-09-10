import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/core/values/constants/app_assets.dart';
import 'package:bayti/source/features/dashboard_notification/presentation/logic/dashboard_notification_controller.dart';
import 'package:bayti/source/global_widgets/app_no_data_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardNotificationPage
    extends GetView<DashboardNotificationController> {
  const DashboardNotificationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppNoDataFoundWidget(
          path: AppAssets.noNotification,
          title: AppStrings.notFoundNotification.tr,
          widthImage: 500,
        ),
      ),
    );
  }
}
