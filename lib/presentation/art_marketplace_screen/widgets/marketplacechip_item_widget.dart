import '../controller/art_marketplace_controller.dart';
import '../models/marketplacechip_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MarketplaceChipItemWidget extends StatelessWidget {
  MarketplaceChipItemWidget(
    this.marketplaceChipItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  final MarketplaceChipItemModel marketplaceChipItemModelObj;
  final ArtMarketplaceController controller = Get.find<ArtMarketplaceController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.filterArt(marketplaceChipItemModelObj.id!.value);
      },
      child: Chip(
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 12.v,
        ),
        backgroundColor: Theme.of(context).primaryColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        label: Column(
          children: [
            Icon(
              marketplaceChipItemModelObj.iconData,
              size: 24.adaptSize,
              color: Theme.of(context).primaryColorDark,
            ),
            Obx(
              () => Text(
                marketplaceChipItemModelObj.label!.value,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleSmallBlack90001,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
