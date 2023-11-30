import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/onboarding_screen/models/onboarding_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A controller class for the OnboardingScreen.
///
/// This class manages the state of the OnboardingScreen, including the
/// current onboardingModelObj
// class OnboardingController extends GetxController {
//   Rx<OnboardingModel> onboardingModelObj = OnboardingModel().obs;
// }
class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  List<OnboardingPage> pages = [
    OnboardingPage(
      logoPath: ImageConstant.imgAirplaneBlack90001,
      imagePath: ImageConstant.imgHellocuate,
      message: 'msg_discover_a_world'.tr,
      buttonText: 'lbl_next'.tr,
      routeName: 'AppRoutes.onboarding1Screen',
    ),
    OnboardingPage(
      logoPath: ImageConstant.imgAirplaneBlack90001,
      imagePath: ImageConstant.imgArtistcuate,
      message:
          'Unleash your inner artist! Experiment with AI-enhanced tools, collaborate with fellow creators, and turn your visions into reality.'
              .tr,
      buttonText: 'lbl_next'.tr,
      routeName: 'AppRoutes.onboarding2Screen',
    ),
    OnboardingPage(
      logoPath: ImageConstant.imgAirplaneBlack90001,
      imagePath: ImageConstant.imgFireplacebro,
      message:
          'Tailor your experience by following your favorite artists and creating collections that reflect your unique tastes.'
              .tr,
      buttonText: 'lbl_get_started'.tr,
      routeName: AppRoutes.signupScreen,
    ),
  ];

  void nextPage() async {
    if (currentPage.value < pages.length - 1) {
      currentPage.value++;
    } else {
      // Save onboarding state
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // Navigate to ArtDiscoveryContainerScreen
      Get.toNamed(pages[currentPage.value].routeName);
      // Get.toNamed(AppRoutes.artDiscoveryContainerScreen);

      await prefs.setBool('onboardingCompleted', true);
    }
  }
}
