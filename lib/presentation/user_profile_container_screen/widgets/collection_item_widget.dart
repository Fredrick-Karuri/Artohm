import '../controller/user_profile_container_controller.dart';
import '../models/collection_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CollectionItemWidget extends StatelessWidget {
  CollectionItemWidget(
    this.collectionItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CollectionItemModel collectionItemModelObj;

  var controller = Get.find<UserProfileContainerController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle11120x160,
            height: 120.v,
            width: 160.h,
            radius: BorderRadius.circular(
              8.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              top: 4.v,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        collectionItemModelObj.collectionText!.value,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                    SizedBox(height: 2.v),
                    Obx(
                      () => Text(
                        collectionItemModelObj.artworkText!.value,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodySmallLatoLight,
                      ),
                    ),
                  ],
                ),
                CustomImageView(
                  svgPath: ImageConstant.imgIconsBlack90002,
                  height: 20.v,
                  width: 4.h,
                  margin: EdgeInsets.only(
                    left: 59.h,
                    top: 3.v,
                    bottom: 4.v,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
