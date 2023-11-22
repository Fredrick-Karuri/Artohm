import 'controller/onboarding1_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding1Screen extends GetWidget<Onboarding1Controller> {
  const Onboarding1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgAirplaneBlack90001,
                          height: 59.v,
                          width: 45.h),
                      SizedBox(height: 56.v),
                      CustomImageView(
                          svgPath: ImageConstant.imgArtistcuate,
                          height: 260.v,
                          width: 261.h),
                      Container(
                          width: 351.h,
                          margin:
                              EdgeInsets.only(left: 4.h, top: 58.v, right: 3.h),
                          child: Text("msg_discover_a_world".tr,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(height: 1.50))),
                      SizedBox(height: 77.v),
                      SizedBox(
                          height: 17.v,
                          child: AnimatedSmoothIndicator(
                              duration: const Duration(milliseconds: 300),
                              activeIndex: 1,
                              count: 3,
                              effect: ScrollingDotsEffect(
                                  spacing: 4,
                                  dotColor: appTheme.red30044,
                                  activeDotColor: appTheme.red300,
                                  dotHeight: 17.v,
                                  dotWidth: 17.h))),
                      SizedBox(height: 40.v),
                      CustomElevatedButton(
                          height: 35.v,
                          text: "lbl_next".tr,
                          onTap: () {
                            onTapNext();
                          })
                    ]))));
  }

  /// Navigates to the onboardingOneScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the onboardingOneScreen.
  onTapNext() {
    Get.toNamed(
      AppRoutes.onboardingOneScreen,
    );
  }
}
