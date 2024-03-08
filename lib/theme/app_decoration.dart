import 'package:flutter/material.dart';
import 'package:artohmapp/core/app_export.dart';

class AppDecoration {
  // Fill decorations

  // 0XFFEAF4FF
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.16),
      );
  static BoxDecoration get fillPrimaryOpacity => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.2),
      );
  static BoxDecoration get fillPrimaryOpacity2 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.1),
      );
  static BoxDecoration get fillSecondaryContainer => BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
      );
  static BoxDecoration get fillSecondaryOpacity => BoxDecoration(
        color: theme.colorScheme.secondary.withOpacity(0.08),
      );

  static BoxDecoration get fillBackground => BoxDecoration(
        color: theme.colorScheme.background,
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.onBackground.withOpacity(0.16),
          width: 1.h,
          strokeAlign: strokeAlignOutside,
        ),
      );
  static BoxDecoration get outlineBottomSide => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.onBackground.withOpacity(0.16),
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get outlineSecondary => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.secondary.withOpacity(1),
          width: 1.h,
          strokeAlign: strokeAlignOutside,
        ),
      );
  
  static BoxDecoration get fillSecondary => BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(20.h),
        
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineTertiary => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.tertiary,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineTertiaryFillPrimary => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.16),
        border: Border.all(
          color: theme.colorScheme.tertiary,
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
