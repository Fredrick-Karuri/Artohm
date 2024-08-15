import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/profile_container_screen/models/enchantedforest_item_model.dart';
import 'package:artohmapp/presentation/profile_container_screen/widgets/enchantedforest_item_widget.dart';
import 'package:artohmapp/widgets/custom_appbar_component.dart';
import 'package:flutter/material.dart';
import 'package:artohmapp/presentation/profile_container_screen/controller/user_profile_container_controller.dart';

class YourArtworksPage extends StatelessWidget {
  UserProfileContainerController controller =
      Get.find<UserProfileContainerController>();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBarComponent(
        title: "Your Artworks",
        onBackPressed: () {
          Get.back();
        },
      ),
      body: Container(
        margin: EdgeInsets.only(left: 8.h, right: 8.h, top: 16.v),
        child: Obx(
          () => GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // mainAxisExtent: 172.v,
              crossAxisCount: 2,
              mainAxisSpacing: 13.h,
              // crossAxisSpacing: 13.h,
              childAspectRatio: 0.8,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.userProfileContainerModelObj.value
                .enchantedforestItemList.value.length,
            itemBuilder: (context, index) {
              EnchantedforestItemModel model = controller
                  .userProfileContainerModelObj
                  .value
                  .enchantedforestItemList
                  .value[index];
              return EnchantedforestItemWidget(model);
            },
          ),
        ),
      ),
    ));
  }
}
