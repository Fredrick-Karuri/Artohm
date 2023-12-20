import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getOnboardingStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;
  return onboardingCompleted;
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getOnboardingStatus(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == true) {
            // If onboarding is completed, navigate to the initial route
            Future.delayed(Duration.zero, () {
              Get.offAllNamed(AppRoutes.signupScreen);
            });
          } else {
            // If onboarding is not completed, navigate to the onboarding screen
            Future.delayed(Duration.zero, () {
              Get.offAllNamed(AppRoutes.initialRoute);
            });
          }
        }
        // While waiting for the future to complete, show the splash screen
        return Scaffold(
          body: Center(
            child: CustomImageView(
              svgPath: ImageConstant.imgArtohmlogo,
              height: 59.v,
              width: 45.h,
            ),
          ),
        );
      },
    );
  }
}
