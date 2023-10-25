import '../controller/art_marketplace_controller.dart';
import '../models/marketplacechip_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MarketplacechipItemWidget extends StatelessWidget {
  MarketplacechipItemWidget(
    this.marketplacechipItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  MarketplacechipItemModel marketplacechipItemModelObj;

  var controller = Get.find<ArtMarketplaceController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.fillLightBlueA.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            svgPath: ImageConstant.imgIconsAmber300,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
          SizedBox(height: 2.v),
          Obx(
            () => Text(
              marketplacechipItemModelObj.label!.value,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.titleSmallBlack90001,
            ),
          ),
        ],
      ),
    );
  }
}
