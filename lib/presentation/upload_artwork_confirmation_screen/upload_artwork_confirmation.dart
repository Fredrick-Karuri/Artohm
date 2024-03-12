import 'dart:io';

import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:artohmapp/presentation/upload_artwork_screen/controller/upload_artwork_controller.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

class UploadArtworkConfirmationScreen extends StatelessWidget {
  final UploadArtworkController uploadArtworkController = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          final prefs = snapshot.data!;
          final title = prefs.getString('title') ?? '';
          final description = prefs.getString('description') ?? '';
          final width = prefs.getString('width') ?? '';
          final height = prefs.getString('height') ?? '';
          final imagePath = prefs.getString('image') ?? '';
          final artworkType =
              prefs.getString('artworkType') ?? ''; // Get the artwork type
          final tags = prefs.getStringList('tags') ?? [];
          final mediums = prefs.getStringList('mediums') ?? [];
          final bool forSale = prefs.getBool('forSale') ?? false;
          final double price = prefs.getDouble('price') ?? 0.0;

          return Scaffold(
            appBar: AppBar(
              title: Text('Upload Confirmation'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (imagePath.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: AspectRatio(
                          aspectRatio: 12 / 13,
                          child: Image.file(
                            File(
                              imagePath,
                            ),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Text(
                              'Error loading image',
                            ),
                          ),
                        ),
                      ),
                    ListTile(
                      leading: Text(
                        'Title:',
                        style: CustomTextStyles.titleMedium,
                      ),
                      title: Text(
                        '$title',
                        style: CustomTextStyles.bodyLarge,
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Description:',
                        style: CustomTextStyles.titleMedium,
                      ),
                      title: Text(
                        '$description',
                        style: CustomTextStyles.bodyLarge,
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Dimensions:',
                        style: CustomTextStyles.titleMedium,
                      ),
                      title: Text(
                        '$width x $height',
                        style: CustomTextStyles.bodyLarge,
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Artwork Type:',
                        style: CustomTextStyles.titleMedium,
                      ),
                      title: Text(
                        '$artworkType',
                        style: CustomTextStyles.bodyLarge,
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Price:',
                        style: CustomTextStyles.titleMedium,
                      ),
                      title: Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: CustomTextStyles.bodyLarge,
                      ),
                    ),

                    // Add the tags here
                    // if (tags.isNotEmpty)
                    ListTile(
                      leading: Text(
                        'Tags:',
                        style: CustomTextStyles.titleMedium,
                      ),
                      title: Text(
                        tags.join(', '),
                        style: CustomTextStyles.bodyLarge,
                      ),
                    ),

                    // Add the tags here
                    ListTile(
                      leading: Text(
                        'Mediums:',
                        style: CustomTextStyles.titleMedium,
                      ),
                      title: Text(
                        mediums.join(', '),
                        style: CustomTextStyles.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                  left: 16.h, right: 16.h, bottom: 16.v, top: 8.v),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.uploadArtworkScreen,
                        );
                        // onTapEditArtwork();
                      },
                      text: "lbl_edit_artwork".tr,
                      margin: EdgeInsets.only(right: 12.h),
                    ),
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                        buttonStyle:
                            CustomButtonStyles.fillPrimaryButtonRounded,
                        onTap: () {
                          uploadArtworkController.postArtwork();
                          Get.toNamed(AppRoutes.userProfileContainerScreen);
                        },
                        text: "lbl_post_artwork".tr,
                        margin: EdgeInsets.only(left: 12.h),
                        buttonTextStyle: CustomTextStyles.buttonTextSmall),
                  )
                ],
              ),
            ),
          );
          //   floatingActionButton: FloatingActionButton(
          //     onPressed: () {
          //       uploadArtworkController.postArtwork();
          //       Get.toNamed(AppRoutes.userProfileContainerScreen);
          //     },
          //     child: Icon(Icons.check),
          //     backgroundColor: Colors.green,
          //   ),
          // );
        }
      },
    );
  }
}

// class UploadArtworkConfirmationScreen extends GetWidget<UploadArtworkConfirmationController> {
//   const UploadArtworkConfirmationScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     return SafeArea(
//       child: Scaffold(
//         appBar: CustomAppBarComponent(
//           title: "msg_uploaded_artwork".tr,
//           onBackPressed: () {
//             Get.back();
//           },
//         ),
//         body: bodyContent(),
//         bottomNavigationBar: Padding(
//           padding:
//               EdgeInsets.only(left: 16.h, right: 16.h, bottom: 16.v, top: 8.v),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: CustomOutlinedButton(
//                   onTap: () {
//                     onTapEditArtwork();
//                   },
//                   text: "lbl_edit_artwork".tr,
//                   margin: EdgeInsets.only(right: 12.h),
//                 ),
//               ),
//               Expanded(
//                 child: CustomElevatedButton(
//                   buttonStyle: CustomButtonStyles.fillPrimaryButtonRounded,
//                     onTap: () {
//                       postArtWork(context);
//                     },
//                     text: "lbl_post_artwork".tr,
//                     margin: EdgeInsets.only(left: 12.h),
//                     buttonTextStyle:
//                         CustomTextStyles.buttonTextSmall),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   bodyContent() {
//     return SizedBox(
//       width: mediaQueryData.size.width,
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 5.v),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 8.v),
//               CustomImageView(
//                 imagePath: ImageConstant.imgRectangle15,
//                 radius: BorderRadius.circular(8.h),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   top: 24,
//                 ),
//                 child: Column(
//                   children: [
//                     CustomRowWidget(
//                       title: "lbl_title".tr,
//                       text: "msg_sunset_over_the".tr,
//                     ),
//                     CustomRowWidget(
//                       title: "lbl_medium".tr,
//                       text: "lbl_oil_on_canvas".tr,
//                     ),
//                     CustomRowWidget(
//                       title: "lbl_dimensions".tr,
//                       text: "lbl_24_x_36_inches".tr,
//                     ),
//                     CustomRowWidget(
//                       title: "lbl_description".tr,
//                       text: "msg_a_vibrant_depiction".tr,
//                     ),
//                   ],
//                 ),
//               ),
//               switchCard(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   switchCard() {
//     return Container(
//       margin: EdgeInsets.only(
//         top: 24.v,
//       ),
//       padding: EdgeInsets.all(16.h),
//       decoration: AppDecoration.fillSecondaryOpacity
//           .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("lbl_visibility".tr, style: theme.textTheme.bodyMedium),
//           SizedBox(height: 22.v),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3.v),
//                       child: Text("lbl_private".tr,
//                           style: theme.textTheme.bodyMedium)),
//                   Obx(
//                     () => CustomSwitch(
//                       value: controller.isSelectedSwitch(0),
//                       onChange: (value) {
//                         if (value) {
//                           controller.updateSelectedSwitch(0);
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16.v),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                       padding: EdgeInsets.only(top: 5.v, bottom: 1.v),
//                       child: Text("msg_visible_to_everyone".tr,
//                           style: theme.textTheme.bodyMedium)),
//                   Obx(
//                     () => CustomSwitch(
//                       value: controller.isSelectedSwitch(1),
//                       onChange: (value) {
//                         if (value) {
//                           controller.updateSelectedSwitch(1);
//                         }
//                       },
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(height: 16.v),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3.v),
//                       child: Text("msg_visible_to_followers".tr,
//                           style: theme.textTheme.bodyMedium)),
//                   Obx(
//                     () => CustomSwitch(
//                       value: controller.isSelectedSwitch(2),
//                       onChange: (value) {
//                         if (value) {
//                           controller.updateSelectedSwitch(2);
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

void saveAndPostArtWork(BuildContext context) {
  try {
    // code ti post artwork if the artwork is valid/ post is successful
    Get.snackbar(
      'Success',
      'Artwork Created!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.offAllNamed(AppRoutes.userProfileContainerScreen);
      },
    );
  } catch (e) {
    Get.snackbar(
      'Error',
      'Artwork not created! : $e',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}

/// Navigates to the previous screen.
///
/// When the action is triggered, this function uses the [Get] package to
/// navigate to the previous screen in the navigation stack.
onTapBtnArrowleftone() {
  Get.back();
}

onTapEditArtwork() {
  Get.toNamed(
    AppRoutes.uploadArtworkScreen,
  );
}
