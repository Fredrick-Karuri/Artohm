import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

import '../models/edit_profile_model.dart';

class ProfileFieldWidget extends StatelessWidget {
  final UserProfile field;

  ProfileFieldWidget({required this.field});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    
      children: [
        CustomImageView(
          svgPath: field.iconPath,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: EdgeInsets.only(right: 24.h),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.v, bottom: 3.v),
                child: Text(field.label, style: theme.textTheme.titleSmall),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.h, top: 16.v),
                child: TextField(
                  controller: TextEditingController(text: field.value),
                  onChanged: field.onChanged,
                ),
              ),
              SizedBox(height: 16.v),
            ],
          ),
        ),
      ],
    );
  }
}


// import 'package:artohmapp/core/app_export.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../widgets/custom_outlined_button.dart';
// import '../controller/edit_profile_controller.dart';

// class UserProfileWidget extends StatelessWidget {
//   final EditProfileController controller = Get.put(EditProfileController());

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomImageView(
//               svgPath: ImageConstant.imgProfileiconsRed30024x24,
//               height: 24.adaptSize,
//               width: 24.adaptSize,
//               margin: EdgeInsets.only(bottom: 54.v),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.only(left: 24.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 2.v, bottom: 3.v),
//                       child: Text("lbl_username".tr,
//                           style: theme.textTheme.titleSmall),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 4.h, top: 16.v),
//                       child: TextField(
//                         controller: TextEditingController(
//                             text: controller.userProfile.value.username),
//                         onChanged: (value) =>
//                             controller.editProfileField('username', value),
//                       ),
//                     ),
//                     SizedBox(height: 16.v),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         // Add more TextFields for other fields...
//       ],
//     );
//   }
// }

