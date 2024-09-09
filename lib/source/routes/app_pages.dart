import 'package:bayti/source/features/splash/splash_binding.dart';
import 'package:bayti/source/features/splash/ui/splash_page.dart';
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
  ];
}
