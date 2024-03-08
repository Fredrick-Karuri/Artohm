import '../models/chipviewselect_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChipviewselectItemWidget extends StatelessWidget {
  ChipviewselectItemWidget(
    this.chipviewselectItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ChipviewselectItemModel chipviewselectItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Theme(
        data: ThemeData(
          canvasColor: Colors.transparent,
        ),
        child: RawChip(
          padding: EdgeInsets.symmetric(
            horizontal: 18.h,
            vertical: 31.v,
          ),
          showCheckmark: false,
          labelPadding: EdgeInsets.zero,
          label: Text(
            chipviewselectItemModelObj.select.value,
            style: TextStyle(
              color: theme.colorScheme.secondary,
              fontSize: 14.fSize,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
          selected: chipviewselectItemModelObj.isSelected.value,
          backgroundColor: Colors.transparent,
          selectedColor: theme.colorScheme.secondary.withOpacity(0.2),
          shape: chipviewselectItemModelObj.isSelected.value
              ? RoundedRectangleBorder(
                  side: BorderSide(
                    color: theme.colorScheme.secondary,
                    width: 1.h,
                  ),
                  borderRadius: BorderRadius.circular(
                    8.h,
                  ),
                )
              : RoundedRectangleBorder(
                  side: BorderSide(
                    color: theme.colorScheme.secondary,
                    width: 1.h,
                  ),
                  borderRadius: BorderRadius.circular(
                    8.h,
                  ),
                ),
          onSelected: (value) {
            chipviewselectItemModelObj.isSelected.value = value;
          },
        ),
      ),
    );
  }
}
