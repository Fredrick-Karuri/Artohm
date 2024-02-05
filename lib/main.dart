import 'package:artohmapp/presentation/onboarding_screen/controller/onboarding_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:artohmapp/global_states.dart';

late final SupabaseClient supabase;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) async {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);

    // Load the .env file
    await dotenv.load();

    // Initialize Supabase
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
    );

    supabase = Supabase.instance.client;
    final session = supabase.auth.currentSession;
    Get.put(GlobalOnboardingController());
    GlobalOnboardingController globalOnboardingController = Get.find();
    bool onboardingCompleted =
        globalOnboardingController.onboardingCompleted.value;
    Get.put(LoginController());
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool onboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;
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
    );
  }
}
