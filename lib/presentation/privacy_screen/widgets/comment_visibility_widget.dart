import '../models/comment_visibilty_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommentVisibilityWidget extends StatelessWidget {
  final VoidCallback onSelected;
  CommentVisibilityWidget(
    this.commentVisibilityModelObj,
     this.onSelected, {
    Key? key,
  }) : super(
          key: key,
        );

  CommentVisibilityModel commentVisibilityModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Theme(
        data: ThemeData(
          canvasColor: Colors.transparent,
        ),
        child: RawChip(
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 32.v,
          ),
          showCheckmark: false,
          labelPadding: EdgeInsets.zero,
          label: Text(
            commentVisibilityModelObj.select.value,
            style: TextStyle(
              color: commentVisibilityModelObj.isSelected.value
                  ? Colors.white
                  : appTheme.lightBlueA700,
              fontSize: 14.fSize,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
          selected: commentVisibilityModelObj.isSelected.value,
          backgroundColor: Colors.transparent,
          selectedColor: appTheme.lightBlueA700.withOpacity(1),
          shape: commentVisibilityModelObj.isSelected.value
              ? RoundedRectangleBorder(
                  side: BorderSide(
                    color: appTheme.lightBlueA700,
                    width: 1.h,
                  ),
                  borderRadius: BorderRadius.circular(
                    8.h,
                  ),
                )
              : RoundedRectangleBorder(
                  side: BorderSide(
                    color: appTheme.lightBlueA700,
                    width: 1.h,
                  ),
                  borderRadius: BorderRadius.circular(
                    8.h,
                  ),
                ),
          onSelected: (value) {
            if (value) {
              this.onSelected();
            }
            commentVisibilityModelObj.isSelected.value = value;
          },
        ),
      ),
    );
  }
}
