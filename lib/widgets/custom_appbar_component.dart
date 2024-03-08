import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';

class CustomAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final bool hasTrailingIcon;
  final IconData trailingIcon;
  final Function onTapTrailingIcon;
  final bool hasTitle;
  final Function onBackPressed;
  final int cartItemCount;

  CustomAppBarComponent({
    this.title,
    this.hasTitle = true,
    this.hasTrailingIcon = false,
    this.trailingIcon = Icons.settings,
    this.onTapTrailingIcon = defaultTrailingIconFunction,
    required this.onBackPressed,
    this.cartItemCount = 0,
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
        color: theme.colorScheme.tertiary,
      ),
      title: hasTitle
          ? AppbarTitle(
              text: title ?? '',
              margin: EdgeInsets.only(
                left: 8.h,
              ),
            )
          : null,
      actions: hasTrailingIcon
          ? <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        trailingIcon,
                        color: theme.colorScheme.tertiary,
                      ),
                      onPressed: () => onTapTrailingIcon(),
                    ),
                    cartItemCount == 0
                        ? Container()
                        : Positioned(
                            right: 0,
                            child: Stack(
                              children: <Widget>[
                                Icon(
                                  Icons.brightness_1,
                                  size: 20.0,
                                  color: Colors.red,
                                ),
                                Positioned(
                                  top: 3.0,
                                  right: 6.0,
                                  child: Center(
                                    child: Text(
                                      cartItemCount.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ]
          : null,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
