import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/edit_profile_screen/widgets/art_styles.dart';
import 'package:artohmapp/presentation/signup_select_account/controller/signup_select_account_controller.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/onboarding_appbar.dart';
import 'package:flutter/material.dart';

class ArtEnthusiastTrackPage extends StatelessWidget {
  final controller = Get.put(ArtEnthusiastDetailsController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ArtworksController());
    Get.find<ArtworksController>();
    return Scaffold(
      appBar: OnboardingAppBar(
        text: 'Art Enthusiast Details',
        showLeadingIcon: true,
        showText: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 32.0),
            ArtStyles('Interests'),
            SizedBox(height: 32.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: appTheme.lightBlueA700),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => SwitchListTile(
                        value: controller.wantsNotifications.value,
                        onChanged: (bool value) {
                          controller.wantsNotifications.value = value;
                        },
                        title: Text('Notifications.',
                            style: theme.textTheme.titleMedium),
                      )),
                  Text(
                    'Receive updates about new artworks, upcoming exhibitions, etc.',
                    style: theme.textTheme.bodyLarge!.copyWith(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 48.0),
            //
            CustomElevatedButton(
                buttonStyle: CustomButtonStyles.fillPrimaryTL8,
                buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                text: 'Next',
                onTap: () {
                  Get.offAllNamed(
                    AppRoutes.artDiscoveryContainerScreen,
                  );
                  // Navigate to the next page
                }),
          ],
        ),
      ),
    );
  }
}
