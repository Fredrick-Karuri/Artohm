import '../controller/user_profile_container_controller.dart';
import '../models/enchantedforest_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EnchantedforestItemWidget extends StatelessWidget {
  EnchantedforestItemWidget(
    this.enchantedforestItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  EnchantedforestItemModel enchantedforestItemModelObj;

  var controller = Get.find<UserProfileContainerController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle your tap here.
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomImageView(
              imagePath: ImageConstant.imgRectangle11135x1081,
              height: 120.v,
              width: 108.h,
              radius: BorderRadius.circular(
                8.h,
              ),
            ),
          ),
          SizedBox(height: 3.v),
          Align(
            alignment: Alignment.center,
            child: Obx(
              () => Text(
                enchantedforestItemModelObj.txt!.value,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelMedium,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              top: 4.v,
            ),
            child: Obx(
              () => Text(
                enchantedforestItemModelObj.txtone!.value,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodySmallLatoLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
