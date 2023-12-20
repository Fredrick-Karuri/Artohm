import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/app_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) async {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;
    runApp(MyApp(onboardingCompleted: onboardingCompleted));
  });
}

class MyApp extends StatelessWidget {
  final bool onboardingCompleted;
  MyApp({required this.onboardingCompleted});
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'Artohm',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.pages,
      // initialRoute:
          // onboardingCompleted ? AppRoutes.artDiscoveryContainerScreen : AppRoutes.initialRoute,
    );
  }
}
