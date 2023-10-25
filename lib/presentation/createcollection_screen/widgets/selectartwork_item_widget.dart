import '../controller/createcollection_controller.dart';
import '../models/selectartwork_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectartworkItemWidget extends StatelessWidget {
  SelectartworkItemWidget(
    this.selectartworkItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SelectartworkItemModel selectartworkItemModelObj;

  var controller = Get.find<CreatecollectionController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(bottom: 2.v),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgRectangle11135x108,
                height: 135.v,
                width: 108.h,
                radius: BorderRadius.circular(
                  8.h,
                ),
              ),
              SizedBox(height: 3.v),
              Obx(
                () => Text(
                  selectartworkItemModelObj.txt!.value,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium,
                ),
              ),
              SizedBox(height: 15.v),
              CustomImageView(
                svgPath: ImageConstant.imgCheckmarkRed300,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
