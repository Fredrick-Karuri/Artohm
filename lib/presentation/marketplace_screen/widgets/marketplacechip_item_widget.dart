import '../controller/marketplace_controller.dart';
import '../models/marketplacechip_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable

class MarketplaceChipItemWidget extends StatelessWidget {
  //  change color of the tapped chip

  MarketplaceChipItemWidget(
    this.marketplaceChipItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  final MarketplaceChipItemModel marketplaceChipItemModelObj;
  final MarketplaceController controller =
      Get.find<MarketplaceController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.h),
      child: GestureDetector(
        onTap: () {
          // Reset isSelected for all chips
          controller.artMarketplaceModelObj.value.marketplaceChipItemList.value
              .forEach((item) {
            item.isSelected!.value = false;
          });

          // Set isSelected for the tapped chip
          marketplaceChipItemModelObj.isSelected!.value = true;

          // Filter the art based on the selected chip id
          controller.filterArt(marketplaceChipItemModelObj.id!.value);
        },
        child: Obx(
          () => Chip(
            padding: EdgeInsets.symmetric(
              horizontal: 8.h,
              vertical: 12.v,
            ),
            backgroundColor: marketplaceChipItemModelObj.isSelected!.value
                ? theme.colorScheme.secondary
                : theme.colorScheme.secondary.withOpacity(.08),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            label: Column(
              children: [
                Icon(
                  marketplaceChipItemModelObj.iconData,
                  size: 24.adaptSize,
                  color: marketplaceChipItemModelObj.isSelected!.value
                      ? Colors.white
                      : theme.primaryColorDark,
                ),
                Obx(
                  () => Text(
                    marketplaceChipItemModelObj.label!.value,
                    overflow: TextOverflow.ellipsis,
                    style: marketplaceChipItemModelObj.isSelected!.value
                        ? CustomTextStyles.titleSmallBackground
                        : CustomTextStyles.titleSmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
