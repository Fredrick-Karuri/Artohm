import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import '../core/utils/image_constant.dart';
import 'app_bar/appbar_image.dart';
import 'app_bar/appbar_subtitle_1.dart';
import 'app_bar/custom_app_bar.dart';

class CustomAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final bool hasTrailingIcon;
  final IconData trailingIcon;
  final Function onTapTrailingIcon;
  final bool hasTitle;

  CustomAppBarComponent(
      {this.title,
      this.hasTitle = true,
      this.hasTrailingIcon = false,
      this.trailingIcon = Icons.settings,
      this.onTapTrailingIcon = defaultTrailingIconFunction});
  static void defaultTrailingIconFunction() {}

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarImage(
          svgPath: ImageConstant.imgArrowleftRed300,
          margin: EdgeInsets.only(
            left: 18.h,
          ),
          onTap: () {
            Navigator.pop(context);
          }),
      title: hasTitle
          ? AppbarSubtitle1(
              text: title ?? '',
              margin: EdgeInsets.only(
                left: 36.h,
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
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ]
          : null,
      styleType: Style.bgFill,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
