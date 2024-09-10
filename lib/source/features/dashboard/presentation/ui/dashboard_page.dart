import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/features/dashboard/presentation/logic/dashboard_controller.dart';
import 'package:bayti/source/features/dashboard/presentation/ui/views/dashboard_tab_bar_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Pages items bottom bar
      body: Obx(
        () {
          return IndexedStack(
            index: controller.state().selectedIndex,
            children: AppConstants.isAdmin
                ? controller.state().pagesAdmin
                : controller.state().pagesCustom,
          );
        },
      ),

      /// Items bottom bar
      bottomNavigationBar: const DashboardTabBarView(),
    );
  }
}
