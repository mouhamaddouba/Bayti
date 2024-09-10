import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/core/values/constants/app_assets.dart';
import 'package:bayti/source/global_widgets/app_bottom_bar_widget.dart';
import 'package:get/get.dart';

class DashboardItemsEnum {
  /// items admin for dashboard
  List<AppTabBarItem> get adminDashboardItems => <AppTabBarItem>[
        //real estat
        AppTabBarItem(
          icon: AppAssets.realEstat,
          text: AppStrings.realEstateTab.tr,
        ),

        //favorite
        AppTabBarItem(
          icon: AppAssets.favorite,
          text: AppStrings.favorite.tr,
        ),

        //offers expired
        AppTabBarItem(
          icon: AppAssets.offersExpired,
          text: AppStrings.offersExpired.tr,
        ),
      ];

  /// items user for dashboard
  List<AppTabBarItem> get customerDashboardItems => <AppTabBarItem>[
        //real estat
        AppTabBarItem(
          icon: AppAssets.realEstat,
          text: AppStrings.realEstateTab.tr,
        ),

        //favorite
        AppTabBarItem(
          icon: AppAssets.favorite,
          text: AppStrings.favorite.tr,
        ),

        //notification
        AppTabBarItem(
          icon: AppAssets.notification,
          text: AppStrings.notifications.tr,
        ),
      ];
}
