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
      padding: EdgeInsets.only(right: 16),

      child: SizedBox(
        height: 200.v,
        width: 260.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomImageView(
              imagePath: imagePath,
              height: 200.v,
              width: 260.h,
              radius: BorderRadius.circular(8.h),
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 158.v),
                padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 4.v),
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderBL8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 144.h,
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
      ),
    );
  }
}
