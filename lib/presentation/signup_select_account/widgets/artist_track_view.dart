import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/edit_profile_screen/widgets/art_styles.dart';
import 'package:artohmapp/presentation/signup_select_account/controller/signup_select_account_controller.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_text_form_field.dart';
import 'package:artohmapp/widgets/onboarding_appbar.dart';
import 'package:flutter/material.dart';

class ArtistTrackPage extends StatelessWidget {
  final controller = Get.put(ArtistTrackController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ArtworksController());
    Get.find<ArtworksController>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: OnboardingAppBar(
        text: 'Artist Details',
        showLeadingIcon: true,
        showText: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 32.0),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Portfolio Link', style: theme.textTheme.titleMedium),
                  SizedBox(height: 8.0),
                  CustomTextFormField(
                    hintText: 'Share the link to your online portfolio',
                    textInputType: TextInputType.text,
                    controller: controller.portfolioLinkController,
                    focusNode: controller.portfolioLinkFocusNode,
                  ),
                ],
              ),

              SizedBox(height: 32.0),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bio', style: theme.textTheme.titleMedium),
                  SizedBox(height: 8.0),
                  CustomTextFormField(
                    hintText:
                        'Tell us about yourself and your artistic journey',
                    textInputType: TextInputType.text,
                    controller: controller.bioController,
                    focusNode: controller.bioFocusNode,
                    maxLines: 3,
                  ),
                ],
              ),

              // TextFormField(
              //   decoration: InputDecoration(labelText: 'Bio'),
              //   maxLines: 3,
              //   onSaved: (value) => controller.bio.value = value!,
              // ),
              ArtStyles('Art Styles'),
              SizedBox(height: 32.0),

              // Add an image upload field here
              CustomElevatedButton(
                buttonStyle: CustomButtonStyles.fillPrimaryTL8,
                buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                text: 'Next',
                onTap: () {
                  Get.offAllNamed(
                    AppRoutes.artDiscoveryContainerScreen,
                  );
                  // Pass the artist details to the next page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
