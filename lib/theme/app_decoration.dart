import 'package:flutter/material.dart';
import 'package:artohmapp/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue50,
      );
  static BoxDecoration get fillLightBlueA => BoxDecoration(
        color: appTheme.lightBlueA700.withOpacity(0.08),
      );
  static BoxDecoration get fillPink => BoxDecoration(
        color: appTheme.pink5002,
      );
  static BoxDecoration get fillPink50 => BoxDecoration(
        color: appTheme.pink50,
      );
  static BoxDecoration get fillPink5001 => BoxDecoration(
        color: appTheme.pink5001,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.16),
      );
  static BoxDecoration get fillPrimary1 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.2),
      );
  static BoxDecoration get fillSecondaryContainer => BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        border: Border.all(
          color: appTheme.black90001.withOpacity(0.08),
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBlack90001 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.black90001.withOpacity(0.16),
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineBlack900011 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.black90001.withOpacity(0.08),
          width: 1.h,
          strokeAlign: strokeAlignOutside,
        ),
      );
  static BoxDecoration get outlineBlack900012 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border(
          bottom: BorderSide(
            color: appTheme.black90001.withOpacity(0.16),
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineBlack900013 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.black90001.withOpacity(0.16),
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineBlack900014 => BoxDecoration(
        color: appTheme.deepOrange50,
        border: Border.all(
          color: appTheme.black90001.withOpacity(0.08),
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black90001.withOpacity(0.16),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray90033,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineLightBlueA => BoxDecoration(
        border: Border.all(
          color: appTheme.lightBlueA700.withOpacity(0.5),
          width: 1.h,
          strokeAlign: strokeAlignOutside,
        ),
      );
  static BoxDecoration get outlineLightblueA700 => BoxDecoration(
        border: Border.all(
          color: appTheme.lightBlueA700,
          width: 1.h,
        ),
      );
  static BoxDecoration get fillLightblueA700 => BoxDecoration(
        color: appTheme.lightBlueA700,
        borderRadius: BorderRadius.circular(20.h),

        border: Border.all(
          color: appTheme.lightBlueA700,
          width: 1.h,
          
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineRed => BoxDecoration(
        border: Border.all(
          color: appTheme.red300,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineRed300 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.16),
        border: Border.all(
          color: appTheme.red300,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get circleBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get circleBorder30 => BorderRadius.circular(
        30.h,
      );
  static BorderRadius get circleBorder40 => BorderRadius.circular(
        40.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL8 => BorderRadius.vertical(
        bottom: Radius.circular(8.h),
      );
  static BorderRadius get customBorderTL4 => BorderRadius.vertical(
        top: Radius.circular(4.h),
      );
  static BorderRadius get customBorderTL8 => BorderRadius.vertical(
        top: Radius.circular(8.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );
  static BorderRadius get roundedBorder56 => BorderRadius.circular(
        56.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
