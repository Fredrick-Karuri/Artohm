import '../models/chipviewcont_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChipviewcontItemWidget extends StatelessWidget {
  ChipviewcontItemWidget(
    this.chipviewcontItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ChipviewcontItemModel chipviewcontItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 10.h,
          vertical: 6.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          chipviewcontItemModelObj.cont.value,
          style: TextStyle(
            color: appTheme.black900.withOpacity(0.6),
            fontSize: 14.fSize,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: chipviewcontItemModelObj.isSelected.value,
        backgroundColor: theme.colorScheme.background,
        selectedColor: theme.colorScheme.background,
        shape: chipviewcontItemModelObj.isSelected.value
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: appTheme.black900.withOpacity(0.6),
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(
                  8.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  8.h,
                ),
              ),
        onSelected: (value) {
          chipviewcontItemModelObj.isSelected.value = value;
        },
      ),
    );
  }
}
