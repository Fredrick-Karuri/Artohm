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
          Flexible(
            flex: 6,
            child: CustomImageView(
              imagePath: ImageConstant.imgRectangle11120x160,
              height: 120.v,
              width: 160.h,
              radius: BorderRadius.circular(
                8.h,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(
                left: 8.h,
                top: 8.v,
              ),
              child: Container(
                margin: EdgeInsets.only(right: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              collectionItemModelObj.collectionText!.value,
                              overflow: TextOverflow.ellipsis,
                              // style: theme.textTheme.labelMedium,
                              style: theme.textTheme.labelLarge,

                            ),
                          ),
                          SizedBox(height: 2.v),
                          Obx(
                            () => Text(
                              collectionItemModelObj.artworkText!.value,
                              overflow: TextOverflow.ellipsis,
                              // style: CustomTextStyles.bodySmallLatoLight,
                              style: theme.textTheme.bodyMedium,

                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgIconsblack90001,
                      height: 20.v,
                      width: 4.h,
                      margin: EdgeInsets.only(
                        top: 3.v,
                        bottom: 4.v,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
