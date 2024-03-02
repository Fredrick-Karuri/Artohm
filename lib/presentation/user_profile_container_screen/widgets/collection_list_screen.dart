import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/models/collections/collections_model.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/user_profile_container_screen/widgets/collection_card.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CollectionListWidget extends StatelessWidget {
  final List<Collection> collections;

  CollectionListWidget({required this.collections});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Collections',
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 12.v),
            Container(
              height: 280.v,
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: collections.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: CollectionCard(collection: collections[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        CustomOutlinedButton(
          text: "msg_create_collection".tr,
          buttonTextStyle: CustomTextStyles.titleSmallRobotoRed300,
          onTap: onTapCreate,
        ),
      ],
    );
  }
}

onTapCreate() {
  Get.toNamed(
    AppRoutes.createcollectionScreen,
  );
}
