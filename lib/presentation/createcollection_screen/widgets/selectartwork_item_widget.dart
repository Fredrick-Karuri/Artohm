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
              Obx(() => selectartworkItemModelObj.imagePath?.value != null
                      ? Image.asset(selectartworkItemModelObj.imagePath!.value)
                      : Container() // This will be used when imagePath is null
                  ),
              // Use the image path from the model
              SizedBox(height: 3.v),
              Obx(
                () => Text(
                  selectartworkItemModelObj.txt!.value,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium,
                ),
              ),
              SizedBox(height: 15.v),
              OutlinedButton(
                onPressed: () {
                  // Handle the selection here
                },
                child: Icon(
                    Icons.check), // Use an icon or any other widget you want
              ),
            ],
          ),
        ),
      ),
    );
  }
}
