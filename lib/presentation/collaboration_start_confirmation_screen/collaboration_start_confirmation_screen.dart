import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_appbar_component.dart';
import '../../widgets/custom_switch.dart';
import '../upload_artwork_two_screen/widgets/custom_row.dart';
import 'controller/collaboration_start_confirmation_controller.dart';

class CollaborationStartConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use GetBuilder to access the controller
    return GetBuilder<CollaborationStartConfirmationController>(
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBarComponent(
            title: "Confirm Collaboration".tr,
            onBackPressed: () {
              Get.back();
            },
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: Column(
                children: [
                  Container(
                    child: CustomImageView(
                      imagePath: ImageConstant.imgRectangle15,
                      radius: BorderRadius.circular(8.h),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24, right: 16),
                    child: Column(
                      children: [
                        CustomRowWidget(
                          title: "lbl_title".tr,
                          text: "msg_sunset_over_the".tr,
                        ),
                        CustomRowWidget(
                          title: "lbl_medium".tr,
                          text: "lbl_oil_on_canvas".tr,
                        ),
                        CustomRowWidget(
                          title: "Collaborators".tr,
                          text: "Sarah Smith, Daniel Johnson".tr,
                        ),
                        CustomRowWidget(
                          title: "lbl_description".tr,
                          text: "msg_a_vibrant_depiction".tr,
                        ),
                      ],
                    ),
                  ),

                  visibility(controller),
                  // Add your widgets here...
                ],
              ),
            ),
          ),
          bottomNavigationBar: bottomBar(),
        );
      },
    );
  }

  visibility(CollaborationStartConfirmationController controller) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: theme.colorScheme.surface),
      margin: EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text('Toggle Visibility',
                style: CustomTextStyles.titleMediumLatoOnBackground),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Public Collaboration'),
                  Obx(
                    () => CustomSwitch(
                        value: controller.isSelectedPublicSwitch.value,
                        onChange: (value) {
                          controller.isSelectedPublicSwitch.value = value;
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Private Collaboration'),
                  Obx(
                    () => CustomSwitch(
                        value: controller.isSelectedPrivateSwitch.value,
                        onChange: (value) {
                          controller.isSelectedPrivateSwitch.value = value;
                        }),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  bottomBar() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomOutlinedButton(
              buttonTextStyle: TextStyle(),
              onTap: () {
                Get.back();
              },
              text: 'Edit ',
            ),
          ),
           const SizedBox(width: 4.0), // Add some fixed spacing between buttons
          Expanded(
            child: CustomElevatedButton(
              buttonStyle:CustomButtonStyles.fillPrimaryButtonRounded,
              onTap: () {
                Get.toNamed(AppRoutes.newCollaborationItemPage);
              },
              text: 'Create Collaboration',
            ),
          ),

        ],
      ),
    );
  }
}
