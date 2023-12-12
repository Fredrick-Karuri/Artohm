import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme_helper.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_image_view.dart';

class ListingCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String description;
  final VoidCallback onButtonPressed;

  ListingCard({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineGray
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: imagePath,
            height: 180.v,
            width: 264.h,
            radius: BorderRadius.circular(8.h),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  width: 244.h,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall!.copyWith(height: 1.40),
                  ),
                ),
                SizedBox(height: 9.v),
                Row(
                  children: [
                    SizedBox(
                      height: 30.v,
                      width: 45.h,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgEllipse130x30,
                            height: 30.adaptSize,
                            width: 30.adaptSize,
                            radius: BorderRadius.circular(15.h),
                            alignment: Alignment.centerLeft,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgEllipse11,
                            height: 30.adaptSize,
                            width: 30.adaptSize,
                            radius: BorderRadius.circular(15.h),
                            alignment: Alignment.centerRight,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 21.h, top: 4.v, bottom: 4.v),
                      child: Text(
                        subtitle,
                        style: theme.textTheme.bodyMedium,
                         maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 9.v),
                SizedBox(
                  width: 244.h,
                  child: Text(
                    "msg_august_3_september".tr,
                    style: CustomTextStyles.bodyMediumLight,
                  ),
                ),
                SizedBox(height: 8.v),
                SizedBox(
                  width: 244.h,
                  child: Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMediumBlack90001
                        .copyWith(height: 1.50),
                  ),
                ),
                SizedBox(height: 8.v),
                CustomElevatedButton(
                  onTap: onButtonPressed,
                  width: 250.h,
                  text: 'Curious...',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
