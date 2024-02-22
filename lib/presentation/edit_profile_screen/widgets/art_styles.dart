import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/edit_profile_screen/controller/edit_profile_controller.dart';
import 'package:artohmapp/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:artohmapp/presentation/edit_profile_screen/widgets/selectedstyles_item_widget.dart';
import 'package:artohmapp/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';

class ArtStyles extends StatelessWidget {
  final String title;
  ArtStyles(this.title);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => EditProfileController());
    final EditProfileController controller = Get.find<EditProfileController>();
    return Container(
      width: 358.h,
      margin: EdgeInsets.only(
        top: 36.v,
      ),
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillBlue
          .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTitle(),
          SizedBox(height: 15.v),
          buildDropDown(controller),
          SizedBox(height: 12.v),
          buildSelectedStyles(controller),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Column(
      children: [
        SizedBox(height: 2.v),
        Text(title, style: theme.textTheme.titleSmall),
      ],
    );
  }

  Widget buildDropDown(EditProfileController controller) {
    return CustomDropDown(
      hintText: "Choose Style".tr,
      hintStyle: CustomTextStyles.bodyLargeBlack90001_2,
      items: controller.editProfileModelObj.value.dropdownItemList.value,


      borderDecoration: DropDownStyleHelper.outlineBlackTL81,
      onChanged: (value) {
        controller.onSelected(value);
      },
    );
  }

  Widget buildSelectedStyles(EditProfileController controller) {
    return Obx(
      () => Wrap(
        spacing: 12.h,
        children: List<Widget>.generate(
          controller.editProfileModelObj.value.selectedstylesItemList.value.length,
          (index) {
            SelectedstylesItemModel model = controller.editProfileModelObj
                .value.selectedstylesItemList.value[index];
            return SelectedstylesItemWidget(model);
          },
        ),
      ),
    );
  }
}
