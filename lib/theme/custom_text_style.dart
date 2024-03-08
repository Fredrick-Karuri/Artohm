import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge => theme.textTheme.bodyLarge!
      .copyWith(color: theme.colorScheme.onBackground);

  static get bodyLargeSecondary => theme.textTheme.bodyLarge!.lato.copyWith(
        color: theme.colorScheme.secondary,
      );

  static get bodyLargeLight => theme.textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.w300,
      );

  static get bodyLargeLibreBaskerville =>
      theme.textTheme.bodyLarge!.libreBaskerville;

  static get bodyMedium => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onBackground,
      );

  static get bodyMediumLibreBaskerville =>
      theme.textTheme.bodyMedium!.libreBaskerville;
  static get bodyMediumLight => theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumSecondary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.secondary,
      );

  static get bodyMediumOnError => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onError.withOpacity(0.6),
      );

  static get bodySmall => theme.textTheme.bodySmall!.lato.copyWith(
        color: theme.colorScheme.onBackground.withOpacity(0.6),
        fontSize: 12.fSize,
      );

  static get bodySmallLight => theme.textTheme.bodySmall!.lato.copyWith(
        fontSize: 10.fSize,
        fontWeight: FontWeight.w300,
      );

  static get bodySmallOnError => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onError.withOpacity(1),
        fontSize: 12.fSize,
      );
  static get bodySmallTertiary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.tertiary,
      );

  // Label text style
  static get labelLargeOnbackground => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onBackground,
      );

  static get labelLargeBackground => theme.textTheme.labelLarge!.lato.copyWith(
        color: theme.colorScheme.background,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeWhite => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
      );

  // Title text style

  static get titleLarge => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onBackground,
      );
  static get titleAppBar => theme.textTheme.titleLarge!.copyWith(
        fontSize: 18,
        color: theme.colorScheme.onBackground.withOpacity(
          0.8,
        ),
        overflow: TextOverflow.ellipsis,
      );

  static get titleMedium => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onBackground,
        fontSize: 18.fSize,
      );

  static get titleMediumLatoOnBackground =>
      theme.textTheme.titleMedium!.lato.copyWith(
        color: theme.colorScheme.onBackground,
        fontWeight: FontWeight.w600,
      );

  // titleSmallBackground

  static get titleSmallBackground => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmallOnBackground => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onBackground.withOpacity(0.8),
      );

  static get titleSmallLatoSecondary =>
      theme.textTheme.titleSmall!.lato.copyWith(
        color: theme.colorScheme.secondary,
      );
  static get titleSmallLatoSecondaryMedium =>
      theme.textTheme.titleSmall!.lato.copyWith(
        color: theme.colorScheme.secondary,
        fontWeight: FontWeight.w500,
      );

  static get titleSmallOnError => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onError,
      );

  static get buttonTextSmall => theme.textTheme.titleSmall!.lato.copyWith(
      color: theme.colorScheme.background,
      fontWeight: FontWeight.w500,
      fontSize: 14);
  static get buttonText => theme.textTheme.titleLarge!.lato.copyWith(
        fontSize: 16,
        color: theme.colorScheme.background,
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get libreBaskerville {
    return copyWith(
      fontFamily: 'Libre Baskerville',
    );
  }
}
