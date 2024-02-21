import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/signup_select_account/controller/signup_select_account_controller.dart';
import 'package:artohmapp/presentation/signup_select_account/widgets/account_type_card.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SelectAccountTypePage extends StatelessWidget {
  final controller = Get.put(AccountTypeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Account Type'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AccountTypeCard(
              accountType: AccountType.artist,
              title: 'Artist',
              description: 'I create art and want to showcase my work.',
              icon: Icons.brush,
              color: appTheme.red300,
            ),
            SizedBox(height: 32.0),
            AccountTypeCard(
              accountType: AccountType.enthusiast,
              title: 'Art Enthusiast',
              description: 'I appreciate art and want to discover new artists.',
              icon: Icons.favorite,
              color: appTheme.lightBlueA700,
            ),
            SizedBox(height: 56.0),
            Obx(
  () => CustomElevatedButton(
    buttonStyle: CustomButtonStyles.fillPrimaryTL8,
    buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
    text: 'Next',
    onTap: controller.selectedType.value == AccountType.none
        ? null
        : () {
            if (controller.selectedType.value == AccountType.artist) {
              // Navigate to ArtistTrackPage
              Get.toNamed( AppRoutes.artistTrackPage);
            } else if (controller.selectedType.value == AccountType.enthusiast) {
              // Navigate to ArtEnthusiastTrackPage
              // Get.toNamed( AppRoutes.artEnthusiastTrackPage);
              Get.toNamed( AppRoutes.artistTrackPage);


            }
          },
  ),
)

          ],
        ),
      ),
    );
  }
}
