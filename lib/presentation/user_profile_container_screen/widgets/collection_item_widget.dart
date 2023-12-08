import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';

import '../../../widgets/custom_outlined_button.dart';
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
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CustomImageView(
                        onTap: () {
                          showModal(context);
                        },
                        svgPath: ImageConstant.imgIconsblack90001,
                        height: 24.v,
                        width: 24.h,
                        margin: EdgeInsets.only(
                          top: 3.v,
                          bottom: 4.v,
                        ),
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

void showModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: FractionallySizedBox(
          widthFactor: 0.94,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFEE9E9),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              border: Border.all(
                color: Color.fromRGBO(245, 140, 140, 0.075),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  blurRadius: 4.0,
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 13.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Abstract Wonders',
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 75,
                      height: 32,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF007BFF)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Public',
                            style: TextStyle(
                              color: Color(0xFF007BFF),
                              fontSize: 16,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              height: 0.19,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16,),
                modalArtworks(),
                SizedBox(height: 16,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Collection Description',
                      style: CustomTextStyles.titleMediumLato,
                    ),
                    // style: CustomTextStyles.titleMediumLato,

                    SizedBox(
                      height: 8,
                    ),
                    Container(
                        child: Text(
                            'Embrace the world of abstraction with our "Abstract Masterpieces" collection. Delve into the realm of non-representational art, where colors, shapes, and forms take center stage. '))
                  ],
                ),
                ctaButtons(),
              ],
            ),
          ),
        ),
      );
    },
  );
}

ctaButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: CustomOutlinedButton(
          text: "msg_create_collection".tr,
          margin: EdgeInsets.only(top: 23.v),
          buttonTextStyle: CustomTextStyles.titleSmallLatoRed300Medium,
          onTap: () {
            // onTapCreate();
          },
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        child: CustomElevatedButton(
          text: "msg_create_collection".tr,
          margin: EdgeInsets.only(
            top: 23.v,
          ),
          buttonTextStyle: CustomTextStyles.titleSmallLatoWhiteA700Medium,
          onTap: () {
            // onTapCreate();
          },
        ),
      ),
    ],
  );
}

modalArtworks() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '12 artworks',
        style: CustomTextStyles.titleMediumLato,
      ),
                SizedBox(height: 8,),

      Container(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 10),
              width: 100.0,
              child: Image.asset(ImageConstant.imgRectangle11200x1604),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              width: 100.0,
              child: Image.asset(ImageConstant.imgRectangle11200x1604),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              width: 100.0,
              child: Image.asset(ImageConstant.imgRectangle11200x1604),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              width: 100.0,
              child: Image.asset(ImageConstant.imgRectangle11200x1604),
            ),
          ],
        ),
      ),
    ],
  );
}
