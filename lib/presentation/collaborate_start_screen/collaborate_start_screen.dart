import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_drop_down.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:artohmapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/size_utils.dart';
import '../../widgets/custom_appbar_component.dart';
import 'controller/collaboration_start_controller.dart';

class NewCollaborationItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use GetBuilder to access the controller
    return GetBuilder<NewCollaborationItemController>(
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBarComponent(
            title: "Create Something Amazing Together".tr,
            onBackPressed: () {
              Get.back();
            },
          ),
          resizeToAvoidBottomInset: true,

          // appBar: AppBar(
          //   title: Text('Create Something Amazing Together'),
          // ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  name(controller),
                  SizedBox(height: 32),
                  description(controller),
                  SizedBox(height: 32),
                  mediums(controller),
                  SizedBox(height: 32),
                  images(),
                  SizedBox(height: 32),

                  collaborators(controller),

                  // Add your widgets here...
                ],
              ),
            ),
          ),
          bottomNavigationBar: CustomElevatedButton(
            onTap: () {
              Get.toNamed(AppRoutes.collaborationStartConfirmationPage);
            },
            text: 'Save',
            margin: EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
          ),
        );
      },
    );
  }

  Column collaborators(NewCollaborationItemController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Collaborators',
        ),
        CustomTextFormField(
          controller: controller.inputCollaboratorsController,
          focusNode: controller.collaboratorsFocusNode,
          margin: EdgeInsets.only(
            top: 8.h,
          ),
          hintText:
              ' Start typing the usernames of artists you want to collaborate with.'
                  .tr,
          hintStyle: CustomTextStyles.bodyLargeBlack90001,
          borderDecoration: TextFormFieldStyleHelper.fillBlue,
          filled: true,
          fillColor: appTheme.blue50,
        )
      ],
    );
  }

  Container images() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: appTheme.blue50,
        borderRadius: BorderRadius.circular(8),
      ),
      // width: 320.v,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              ' Upload images or concept art related to your collaboration.',
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  text: 'Choose Image',
                ),
              ),
              SizedBox(
                width: 10.h,
              ),
              Expanded(
                child: CustomOutlinedButton(
                  text: 'Take a Photo',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  mediums(NewCollaborationItemController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: appTheme.blue50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text('Medium'),
          ),
          CustomDropDown(
            dropdownColor: appTheme.blue50,
            width: 200.h,
            hintText: 'Choose Medium',
            items: controller
                .newCollaborationItemModelObj.value.dropdownItemList!.value,
            contentPadding:
                EdgeInsets.only(left: 16.h, top: 10.v, bottom: 16.v, right: 16),
            onChanged: (value) {
              controller.onSelected(value);
            },
          ),
        ],
      ),
    );
  }

  description(NewCollaborationItemController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Collaboration Description',
        ),
        CustomTextFormField(
          controller: controller.inputDescriptionController,
          focusNode: controller.descriptionFocusNode,
          margin: EdgeInsets.only(
            top: 8.h,
          ),
          hintText: ' A short description of your collaboration idea.'.tr,
          hintStyle: CustomTextStyles.bodyLargeBlack90001,
          borderDecoration: TextFormFieldStyleHelper.fillBlue,
          filled: true,
          fillColor: appTheme.blue50,
        )
      ],
    );
  }

  name(NewCollaborationItemController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Project Name',
        ),
        CustomTextFormField(
          controller: controller.inputNameController,
          focusNode: controller.nameFocusNode,
          margin: EdgeInsets.only(
            top: 8.h,
          ),
          hintText:
              'Enter a unique and inspiring name for your collaboration.'.tr,
          hintStyle: CustomTextStyles.bodyLargeBlack90001,
          borderDecoration: TextFormFieldStyleHelper.fillBlue,
          filled: true,
          fillColor: appTheme.blue50,
        )
      ],
    );
  }
}
// class NewCollaborationItemPage
//     extends GetWidget<NewCollaborationItemController> {
//   const NewCollaborationItemPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     return SafeArea(
//       child: Scaffold(
//         appBar: CustomAppBarComponent(title: "lbl_collaborate".tr),
//         body: Column(
//           children: [
//             // Add your widgets here...
//           ],
//         ),
//       ),
//     );
//   }
// }



