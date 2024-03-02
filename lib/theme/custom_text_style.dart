import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18.fSize,
      );
  static get bodyLargeBlack => theme.textTheme.bodyLarge!
      .copyWith(color: theme.colorScheme.onBackground);

  static get bodyLargeLato => theme.textTheme.bodyLarge!.lato;
  static get bodyLargeLato18 => theme.textTheme.bodyLarge!.lato.copyWith(
        fontSize: 18.fSize,
      );
  static get bodyLargeLatoBlack => theme.textTheme.bodyLarge!.lato.copyWith(
        color: theme.colorScheme.onBackground,
      );

  static get bodyLargeLatoBlue => theme.textTheme.bodyLarge!.lato.copyWith(
        color: theme.colorScheme.secondary,
      );
  static get bodyLargeLatoWhite => theme.textTheme.bodyLarge!.lato.copyWith(
        color: theme.colorScheme.background,
      );
  static get bodyLargeLibreBaskerville =>
      theme.textTheme.bodyLarge!.libreBaskerville;
  static get bodyLargeLight => theme.textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.w300,
      );

  static get bodyMediumBlack => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onBackground,
      );

  static get bodyMediumBlack_1 => theme.textTheme.bodyMedium!.inter;
  static get bodyMediumLibreBaskerville =>
      theme.textTheme.bodyMedium!.libreBaskerville;
  static get bodyMediumLight => theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumLightblueA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.lightBlueA700,
      );
  static get bodyMediumLightblueA700_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.lightBlueA700,
      );
  static get bodyMediumOnError => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onError.withOpacity(0.6),
      );
  static get bodyMediumRed300 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.red300,
      );
  static get bodyMediumRobotoBlack90001 =>
      theme.textTheme.bodyMedium!.roboto.copyWith(
        color: appTheme.black90001.withOpacity(0.6),
      );
  static get bodyMediumRobotoBlack90001_1 =>
      theme.textTheme.bodyMedium!.roboto.copyWith(
        color: appTheme.black90001.withOpacity(0.6),
      );
  static get bodyMediumRobotoblack90001 =>
      theme.textTheme.bodyMedium!.roboto.copyWith(
        color: appTheme.black90001.withOpacity(0.6),
      );
  static get bodyMediumRobotoWhiteA700 =>
      theme.textTheme.bodyMedium!.roboto.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: 12.fSize,
      );
  static get bodySmallLato => theme.textTheme.bodySmall!.lato.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallLato12 => theme.textTheme.bodySmall!.lato.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallLatoBlack90001 =>
      theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.black90001.withOpacity(0.6),
        fontSize: 12.fSize,
      );
  static get bodySmallLatoBlack9000112 =>
      theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.black90001.withOpacity(0.87),
        fontSize: 12.fSize,
      );
  static get bodySmallLatoblack90001 =>
      theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.black90001.withOpacity(0.6),
        fontSize: 12.fSize,
      );
  static get bodySmallLatoblack9000112 =>
      theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.black90001.withOpacity(0.87),
        fontSize: 12.fSize,
      );
  static get bodySmallLatoLight => theme.textTheme.bodySmall!.lato.copyWith(
        fontSize: 10.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodySmallLatoLight12 => theme.textTheme.bodySmall!.lato.copyWith(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodySmallLato_1 => theme.textTheme.bodySmall!.lato;
  static get bodySmallLight => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodySmallLight12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodySmallOnError => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onError.withOpacity(1),
        fontSize: 12.fSize,
      );
  static get bodySmallRed300 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.red300,
      );
  static get bodySmallRoboto => theme.textTheme.bodySmall!.roboto.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallRobotoBlack90001 =>
      theme.textTheme.bodySmall!.roboto.copyWith(
        color: appTheme.black90001.withOpacity(0.87),
        fontSize: 12.fSize,
      );
  static get bodySmallRobotoblack90001 =>
      theme.textTheme.bodySmall!.roboto.copyWith(
        color: appTheme.black90001.withOpacity(0.87),
        fontSize: 12.fSize,
      );
  // Label text style
  static get labelLargeBlack90001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90001,
      );
  static get labelLargeblack90001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90001.withOpacity(0.87),
      );
  static get labelLargeRobotoWhiteA700 =>
      theme.textTheme.labelLarge!.roboto.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get labelMediumInter => theme.textTheme.labelMedium!.inter.copyWith(
        fontWeight: FontWeight.w500,
      );
  // Title text style

  static get titleLargeBlack => theme.textTheme.titleLarge!
      .copyWith(color: theme.colorScheme.onBackground);

  static get titleMedium => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onBackground,
        fontSize: 18.fSize,
      );

  static get titleMediumLato => theme.textTheme.titleMedium!.lato.copyWith(
        color: theme.colorScheme.onBackground,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumLatoWhite => theme.textTheme.titleMedium!.lato.copyWith(
        color: theme.colorScheme.background,
        fontWeight: FontWeight.w600,
      );

  static get titleMediumLatoRed300 =>
      theme.textTheme.titleMedium!.lato.copyWith(
        color: appTheme.red300,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumLatoBlue =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        color: appTheme.lightBlueA700,
        fontWeight: FontWeight.w500,
      );

  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );

  // titleSmallWhite

  static get titleSmallWhite => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmallBlack90001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001.withOpacity(0.87),
      );
  static get titleSmallblack90001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001.withOpacity(0.87),
      );
  static get titleSmallLato => theme.textTheme.titleSmall!.lato.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleSmallLatoBlack90001 =>
      theme.textTheme.titleSmall!.lato.copyWith(
        color: appTheme.black90001.withOpacity(0.8),
        fontWeight: FontWeight.w600,
      );
  static get titleSmallLatoLightblueA700 =>
      theme.textTheme.titleSmall!.lato.copyWith(
        color: appTheme.lightBlueA700,
      );
  static get titleSmallLatoLightblueA700Medium =>
      theme.textTheme.titleSmall!.lato.copyWith(
        color: appTheme.lightBlueA700,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallLatoRed300 => theme.textTheme.titleSmall!.lato.copyWith(
        color: appTheme.red300,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallLatoRed300Medium =>
      theme.textTheme.titleSmall!.lato.copyWith(
        color: appTheme.red300,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallLatoWhiteA700 =>
      theme.textTheme.titleSmall!.lato.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallLatoWhiteA700Medium =>
      theme.textTheme.titleSmall!.lato.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallLatoWhiteA700Medium_1 =>
      theme.textTheme.titleSmall!.lato.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallOnError => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onError,
      );
  static get titleSmallRobotoBlack90001 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoBlack90001Medium =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoRed300 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.red300,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoRed300Medium =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.red300,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoWhiteA700 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoWhiteA700Medium =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get libreBaskerville {
    return copyWith(
      fontFamily: 'Libre Baskerville',
    );
  }
}
