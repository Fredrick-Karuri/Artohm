import '../models/row_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowItemWidget extends StatelessWidget {
  RowItemWidget(
    this.rowItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RowItemModel rowItemModelObj;

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
            vertical: 31.v,
          ),
          showCheckmark: false,
          labelPadding: EdgeInsets.zero,
          label: Text(
            rowItemModelObj.select.value,
            style: TextStyle(
              color: appTheme.lightBlueA700,
              fontSize: 14.fSize,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
          selected: rowItemModelObj.isSelected.value,
          backgroundColor: Colors.transparent,
          selectedColor: appTheme.lightBlueA700.withOpacity(0.2),
          shape: rowItemModelObj.isSelected.value
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
            rowItemModelObj.isSelected.value = value;
          },
        ),
      ),
    );
  }
}
