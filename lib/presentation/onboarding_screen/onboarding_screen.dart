import 'controller/onboarding_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends GetWidget<OnboardingController> {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var page = controller.pages[controller.currentPage.value];
      return SafeArea(
        child: Scaffold(
          body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  svgPath: page.logoPath,
                  imagePath: ImageConstant.imgAirplaneblack900,
                  height: 59.v,
                  width: 45.h,
                ),
                SizedBox(height: 56.v),
                CustomImageView(
                  svgPath: page.imagePath,
                  height: 260.v,
                  width: 296.h,
                ),
                Container(
                  width: 351.h,
                  margin: EdgeInsets.only(left: 4.h, top: 58.v, right: 3.h),
                  child: Text(
                    page.message,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge!.copyWith(height: 1.50),
                  ),
                ),
                SizedBox(height: 77.v),
                SizedBox(
                  height: 17.v,
                  child: AnimatedSmoothIndicator(
                    activeIndex: controller.currentPage.value,
                    count: 3,
                    effect: ScrollingDotsEffect(
                      spacing: 4,
                      activeDotColor: theme.colorScheme.tertiary,
                      dotColor: theme.colorScheme.tertiary,
                      dotHeight: 17.v,
                      dotWidth: 17.h,
                    ),
                  ),
                ),
                SizedBox(height: 40.v),
                CustomElevatedButton(
                  buttonStyle: CustomButtonStyles.fillPrimaryButton,
                  height: 35.v,
                  text: page.buttonText,
                  onTap: controller.nextPage,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
