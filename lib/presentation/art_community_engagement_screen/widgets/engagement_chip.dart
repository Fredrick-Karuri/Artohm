import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_decoration.dart';
import '../../../widgets/custom_image_view.dart';

class CustomContainer extends StatefulWidget {
  final String svgPath;
  final String labelText;

  CustomContainer({required this.svgPath, required this.labelText});

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.v),
        decoration: _isTapped
            ? AppDecoration
                .fillLightblueA700 // Change this to your filled decoration
            : AppDecoration.outlineLightblueA700
                .copyWith(borderRadius: BorderRadiusStyle.circleBorder20),
        child: Row(
          children: [
            CustomImageView(
              svgPath: widget.svgPath,
              height: 24.adaptSize,
              width: 24.adaptSize,
              color: _isTapped
                  ? Colors.white
                  : appTheme.lightBlueA700, // Change color when tapped
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.h, top: 3.v, bottom: 3.v),
              child: Text(
                widget.labelText,
                style: CustomTextStyles.titleSmallLatoLightblueA700Medium
                    .copyWith(
                  color: _isTapped
                      ? Colors.white
                      : appTheme.lightBlueA700, // Change color when tapped
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
