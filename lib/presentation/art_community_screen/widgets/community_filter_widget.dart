import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';


class CommunityFilterWidget extends StatelessWidget {
  final Function onTap;
  final String imagePath;
  final String text;

  CommunityFilterWidget(
      {required this.onTap, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.only(right: 8),
        decoration: AppDecoration.fillPrimary1.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: imagePath,
              height: 69.v,
              width: 165.h,
              radius: BorderRadius.vertical(top: Radius.circular(8.h)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 9.h, top: 10.v, bottom: 7.v),
              child: Text(
                text,
                style: CustomTextStyles.labelLargeBlack90001,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
