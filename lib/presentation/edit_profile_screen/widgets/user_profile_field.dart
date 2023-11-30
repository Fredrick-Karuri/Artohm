import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_outlined_button.dart';
import '../controller/edit_profile_controller.dart';

class UserProfileWidget extends StatelessWidget {
  final EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Obx(
        //   () => GestureDetector(
        //     onTap: controller.changeProfilePhoto,
        //     // child: Image.asset(controller.userProfile.value.imagePath),
        //   ),
        // ),
        SizedBox(height: 16.v),
        CustomOutlinedButton(
          text: "Change Image",
          onTap: controller.changeProfilePhoto,
        ),
        SizedBox(height: 16.v),
        TextField(
          controller: TextEditingController(
              text: controller.userProfile.value.username),
          onChanged: (value) => controller.editProfileField('username', value),
        ),
        // Add more TextFields for other fields...
      ],
    );
  }
}
