import '../models/artwork_visibilty_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ArtworkVisibilityWidget extends StatelessWidget {
  final Function onSelected;
  ArtworkVisibilityWidget(
    this.artworkVisibilityModelObj, {
    required this.onSelected,
    Key? key,
  }) : super(
          key: key,
        );

  ArtworkVisibilityModel artworkVisibilityModelObj;

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
            artworkVisibilityModelObj.select.value,
            style: TextStyle(
              color: artworkVisibilityModelObj.isSelected.value
                  ? theme.colorScheme.background
                  : theme.colorScheme.secondary,
              fontSize: 14.fSize,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
          selected: artworkVisibilityModelObj.isSelected.value,
          backgroundColor: Colors.transparent,
          // selectedColor: appTheme.lightBlueA700.withOpacity(0.2),
          selectedColor: theme.colorScheme.secondary,

          shape: artworkVisibilityModelObj.isSelected.value
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
            if (value) {
              this.onSelected();
            }
            artworkVisibilityModelObj.isSelected.value = value;
          },
        ),
      ),
    );
  }
}
