import 'package:artohmapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../core/utils/image_constant.dart';
import 'app_bar/appbar_image.dart';
import 'app_bar/appbar_subtitle_1.dart';
import 'app_bar/custom_app_bar.dart';

class CustomAppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBarComponent({required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 46.h,
      leading: 
      AppbarImage(
        svgPath: ImageConstant.imgArrowleftRed300,
        margin: EdgeInsets.only(left: 18.h,),
        onTap: () {
          Navigator.pop(context);
        }),
      title: AppbarSubtitle1(
        text: title,
        margin: EdgeInsets.only(left: 36.h,  )),
      styleType: Style.bgFill,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
