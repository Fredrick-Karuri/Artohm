import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

import 'custom_image_view.dart';

class UpcomingEventsCard extends StatelessWidget {
  final Function onTap;
  final String imagePath;
  final String text;

  UpcomingEventsCard(
      {required this.onTap, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: EdgeInsets.only(right: 16),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: imagePath,
            radius: BorderRadius.circular(8.h),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 4.v),
              decoration: AppDecoration.fillPrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderBL8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      text,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.labelLargeWhiteA700
                          .copyWith(height: 1.40),
                    ),
                  ),
                  IconButton(
                    onPressed: () => onTap(),
                    icon: Icon(Icons.more_vert),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
