import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/app_bar/appbar_subtitle.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool showLeadingIcon;
  final bool showText;

  OnboardingAppBar({
    required this.text,
    this.showLeadingIcon = true,
    this.showText = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leadingWidth: showLeadingIcon ? 56.h : 0,
      leading: showLeadingIcon
          ? IconButton(
              onPressed: () {
                onTapArrowleftone();
              },
              icon: Icon(Icons.arrow_back_ios),
              color: theme.colorScheme.tertiary,
              padding: EdgeInsets.only(left: 12),
            )
          : null,
      title: showText
          ? AppbarSubtitle(
              margin: EdgeInsets.only(left: 10),
              text: text,
            )
          : null,
      // styleType: Style.bgOutline,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

onTapArrowleftone() {
  Get.back();
}
