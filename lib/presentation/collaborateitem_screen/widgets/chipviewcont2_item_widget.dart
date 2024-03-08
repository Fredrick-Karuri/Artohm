import '../models/chipviewcont2_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Chipviewcont2ItemWidget extends StatelessWidget {
  Chipviewcont2ItemWidget(
    this.chipviewcont2ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Chipviewcont2ItemModel chipviewcont2ItemModelObj;

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
          chipviewcont2ItemModelObj.conttwo.value,
          style: TextStyle(
            color: appTheme.black900.withOpacity(0.6),
            fontSize: 14.fSize,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: chipviewcont2ItemModelObj.isSelected.value,
        backgroundColor: theme.colorScheme.background,
        selectedColor: theme.colorScheme.background,
        shape: chipviewcont2ItemModelObj.isSelected.value
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
          chipviewcont2ItemModelObj.isSelected.value = value;
        },
      ),
    );
  }
}
