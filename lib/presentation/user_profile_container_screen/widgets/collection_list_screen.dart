import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/models/collections/collections_model.dart';
import 'package:artohmapp/presentation/user_profile_container_screen/widgets/collection_card.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class CollectionListWidget extends StatelessWidget {
  final List<Collection> collections;

  CollectionListWidget({required this.collections});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.h, left: 16.h, bottom: 32.h),
      child: Column(
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
              Obx(() {
                if (collections.isEmpty) {
                  return Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: theme.colorScheme.outline,
                          width: 1.0,
                        ),
                      ),
                      child: Text(
                        'You have not created any collections yet.',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.outline,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 280.v,
                    child: ListView.builder(
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
                  );
                }
              }),
            ],
          ),
          CustomOutlinedButton(
            buttonStyle: CustomButtonStyles.outlinePrimaryButton,
            text: "msg_create_collection".tr,
            onTap: onTapCreate,
          ),
        ],
      ),
    );
  }
}

onTapCreate() {
  Get.toNamed(
    AppRoutes.createcollectionScreen,
  );
}
