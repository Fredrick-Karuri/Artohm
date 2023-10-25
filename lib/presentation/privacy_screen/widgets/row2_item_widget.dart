import '../models/row2_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Row2ItemWidget extends StatelessWidget {
  Row2ItemWidget(
    this.row2ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Row2ItemModel row2ItemModelObj;

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
            row2ItemModelObj.selecttwo.value,
            style: TextStyle(
              color: appTheme.lightBlueA700,
              fontSize: 14.fSize,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
          selected: row2ItemModelObj.isSelected.value,
          backgroundColor: Colors.transparent,
          selectedColor: appTheme.lightBlueA700.withOpacity(0.2),
          shape: row2ItemModelObj.isSelected.value
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
            row2ItemModelObj.isSelected.value = value;
          },
        ),
      ),
    );
  }
}
