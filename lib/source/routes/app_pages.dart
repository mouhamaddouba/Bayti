import 'package:bayti/source/features/dashboard/presentation/dashboard_binding.dart';
import 'package:bayti/source/features/dashboard/presentation/ui/dashboard_page.dart';
import 'package:bayti/source/features/dashboard_favorite/presentation/dashboard_favorite_binding.dart';
import 'package:bayti/source/features/dashboard_notification/presentation/dashboard_notification_binding.dart';
import 'package:bayti/source/features/dashboard_offers_expired/presentation/dashboard_offers_expired_binding.dart';
import 'package:bayti/source/features/dashboard_real_estate/presentation/dashboard_real_estate_binding.dart';
import 'package:bayti/source/features/new_real_estate/presentation/new_real_estate_binding.dart';
import 'package:bayti/source/features/new_real_estate/presentation/ui/new_real_estate_page.dart';
import 'package:bayti/source/features/splash/presentation/splash_binding.dart';
import 'package:bayti/source/features/splash/presentation/ui/splash_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    /// splash
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),

    /// Dashboard
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
      bindings: [
        DashboardBinding(),
        DashboardFavoriteBinding(),
        DashboardRealEstateBinding(),
        DashboardNotificationBinding(),
        DashboardOffersExpiredBinding(),
      ],
      transition: Transition.fadeIn,
    ),

    /// New Real Estate
    GetPage(
      name: AppRoutes.newRealEstate,
      page: () => const NewRealEstatePage(),
      binding: NewRealEstateBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
