import 'package:bayti/app.dart';
import 'package:bayti/source/core/utils/app_network_utils.dart';
import 'package:bayti/source/core/values/constants/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get_storage/get_storage.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

Future<void> main() async {
  /// For check internet connection
  AppNetworkUtilsImpl.init();

  /// Init the widget of flutter
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize sdk for back4app
  await Parse().initialize(
    AppUrls.keyApplicationId,
    AppUrls.baseUrl,
    clientKey: AppUrls.keyClientKey,
    debug: true,
  );

  /// Make screen always vertical
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  /// Init GetStorage
  await GetStorage.init();

  runApp(
    /// Response UI
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) {
        return const App();
      },
    ),
  );
}
