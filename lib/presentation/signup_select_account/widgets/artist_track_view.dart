import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/edit_profile_screen/widgets/art_styles.dart';
import 'package:artohmapp/presentation/signup_select_account/controller/signup_select_account_controller.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ArtistTrackPage extends StatelessWidget {
  final controller = Get.put(ArtistTrackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artist Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Portfolio Link'),
              onSaved: (value) => controller.portfolioLink.value = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Bio'),
              maxLines: 3,
              onSaved: (value) => controller.bio.value = value!,
            ),
            ArtStyles(),
            SizedBox(height: 32.0),

            // Add an image upload field here
            CustomElevatedButton(
                buttonStyle: CustomButtonStyles.fillPrimaryTL8,
                buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                text: 'Next',
                onTap: () {
                  // Navigate to the next page
                  // Pass the artist details to the next page
                }),
          ],
        ),
      ),
    );
  }
}
