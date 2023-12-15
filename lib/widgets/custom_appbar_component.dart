import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import '../core/utils/image_constant.dart';
import 'app_bar/appbar_image.dart';
import 'app_bar/appbar_subtitle_1.dart';
import 'app_bar/custom_app_bar.dart';
class CustomAppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool hasTrailingIcon;
  final IconData trailingIcon;
  final Function onTapTrailingIcon;
  final bool hasTitle;
  final Function onBackPressed;

  CustomAppBarComponent({
    this.title,
    this.hasTitle = true,
    this.hasTrailingIcon = false,
    this.trailingIcon = Icons.settings,
    this.onTapTrailingIcon = defaultTrailingIconFunction,
    required this.onBackPressed,
  });

  static void defaultTrailingIconFunction() {}

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      leading: IconButton(
        padding: EdgeInsets.only(left: 12),
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => onBackPressed(),
        color: appTheme.red300,
      ),
      title: hasTitle
          ? AppbarSubtitle1(
              text: title ?? '',
              margin: EdgeInsets.only(
                left: 8.h,
              ),
            )
          : null,
      actions: hasTrailingIcon
          ? <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  onPressed: () => onTapTrailingIcon(),
                  icon: Icon(
                    trailingIcon,
                    color: appTheme.red300,
                  ),
                ),
              ),
            ]
          : null,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
