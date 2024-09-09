import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:bayti/source/core/translations/app_translations.dart';
import 'package:bayti/source/core/themes/app_themes.dart';
import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/routes/app_pages.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      /// Cancel check banner
      debugShowCheckedModeBanner: false,

      /// Title of appName
      title: AppStrings.appName.tr,

      /// Routing
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splash,

      /// Theme
      theme: AppThemes.getAppTheme(),
      darkTheme: AppThemes.getAppDarkTheme(),
      themeMode: AppThemes.getAppThemeMode(),

      /// Locale
      locale: AppTranslations.getAppLocale(),
      translations: AppTranslations(),
    );
  }
}
