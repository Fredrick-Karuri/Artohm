import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/signup_select_account/controller/signup_select_account_controller.dart';
import 'package:artohmapp/presentation/signup_select_account/widgets/account_type_card.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/onboarding_appbar.dart';
import 'package:flutter/material.dart';

class SelectAccountTypePage extends StatelessWidget {
  final controller = Get.put(AccountTypeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: OnboardingAppBar(
        text: 'Select Account Type',
        showLeadingIcon: true,
        showText: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 32.v),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Please select a track to continue',
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 22.fSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 48.v),
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
                description:
                    'I appreciate art and want to discover new artists.',
                icon: Icons.favorite,
                color: appTheme.lightBlueA700,
              ),
              SizedBox(height: 56.0),
              Obx(
                () => CustomElevatedButton(
                  buttonStyle: controller.selectedType.value == AccountType.none
                      ? CustomButtonStyles.fillPrimaryTL8.copyWith(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled))
                                return Colors.grey;
                              return appTheme
                                  .blueGray400; // Use the component's default.
                            },
                          ),
                        )
                      : CustomButtonStyles.fillPrimaryTL8,
                  buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                  text: 'Next',
                  onTap: controller.selectedType.value == AccountType.none
                      ? null
                      : () {
                          if (controller.selectedType.value ==
                              AccountType.artist) {
                            // Navigate to ArtistTrackPage
                            Get.toNamed(AppRoutes.artistTrackPage);
                          } else if (controller.selectedType.value ==
                              AccountType.enthusiast) {
                            // Navigate to ArtEnthusiastTrackPage
                            Get.toNamed(AppRoutes.artEnthusiastTrackPage);
                          }
                        },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
