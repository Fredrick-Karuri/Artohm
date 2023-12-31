import '../models/selectedstyles_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectedstylesItemWidget extends StatelessWidget {
  SelectedstylesItemWidget(
    this.selectedstylesItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SelectedstylesItemModel selectedstylesItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 7.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          selectedstylesItemModelObj.chips2filterb.value,
          style: TextStyle(
            color: appTheme.black90001,
            fontSize: 14.fSize,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: selectedstylesItemModelObj.isSelected.value,
        backgroundColor: appTheme.whiteA700,
        selectedColor: appTheme.whiteA700,
        shape: selectedstylesItemModelObj.isSelected.value
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: appTheme.black90001.withOpacity(0.6),
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(
                  16.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  16.h,
                ),
              ),
        onSelected: (value) {
          selectedstylesItemModelObj.isSelected.value = value;
        },
      ),
    );
  }
}
