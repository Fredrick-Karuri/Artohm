import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:artohmapp/global_states.dart';

Future<bool> getOnboardingStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;
  return onboardingCompleted;
}

Future<bool> getAccessTokenStatus() async {
  final storage = new FlutterSecureStorage();
  String? accessToken = await storage.read(key: 'accessToken');
  return accessToken != null;
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LoginController loginController = Get.find();
  final GlobalOnboardingController globalOnboardingController = Get.find();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkLoginStatus().then((loggedIn) {
      if (loggedIn) {
        Get.offAllNamed(AppRoutes.artDiscoveryContainerScreen);
      } else {
        checkOnboardingStatus().then((onboardingComplete) => {
              if (onboardingComplete)
                {Get.offAllNamed(AppRoutes.signinScreen)}
              else
                {Get.offAllNamed(AppRoutes.initialRoute)}
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
  }

  Future<bool> checkLoginStatus() async {
    bool accessTokenExists = await getAccessTokenStatus();
    bool isLoggedIn = loginController.isLoggedIn.value;
    return accessTokenExists || isLoggedIn;
  }

  Future<bool> checkOnboardingStatus() async {
    // Call loadOnboardingCompleted to load the status
    await globalOnboardingController.loadOnboardingCompleted();
    // Return the onboardingCompleted status
    return globalOnboardingController.onboardingCompleted.value;
  }

// //TODO: Finish rewriting function to use GlobalOnboardingController
//   Future<bool> checkOnboardingStatus() async {
//     bool onboardingStatus = await getOnboardingStatus();
//     return onboardingStatus;
//   }
}

// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<bool>(
//       future: getOnboardingStatus(),
//       builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.data == true) {
//             // If onboarding is completed, navigate to the initial route
//             Future.delayed(Duration.zero, () {
//               Get.offAllNamed(AppRoutes.signupScreen);
//             });
//           } else {
//             // If onboarding is not completed, navigate to the onboarding screen
//             Future.delayed(Duration.zero, () {
//               Get.offAllNamed(AppRoutes.initialRoute);
//             });
//           }
//         }
//         // While waiting for the future to complete, show the splash screen
//         return Scaffold(
//           body: Center(
//             child: CustomImageView(
//               svgPath: ImageConstant.imgArtohmlogo,
//               height: 59.v,
//               width: 45.h,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
