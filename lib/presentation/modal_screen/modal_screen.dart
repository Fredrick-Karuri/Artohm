import 'controller/modal_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ModalScreen extends GetWidget<ModalController> {
  const ModalScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.deepOrange50,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 13.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 12.v),
              Text(
                "msg_art_unveiling_exploring2".tr,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 18.v),
              Text(
                "lbl_july_30_2023".tr,
                style: CustomTextStyles.titleMediumLato,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 2.h,
                  top: 12.v,
                ),
                child: Text(
                  "msg_artverse_gallery".tr,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              Container(
                width: 336.h,
                margin: EdgeInsets.only(
                  top: 10.v,
                  right: 21.h,
                ),
                child: Text(
                  "msg_join_me_in_unveiling".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomElevatedButton(
          text: "lbl_book_ticket".tr,
          margin: EdgeInsets.only(
            left: 16.h,
            right: 16.h,
            bottom: 24.v,
          ),
          buttonTextStyle: CustomTextStyles.titleSmallRobotoWhiteA700,
        ),
      ),
    );
  }
}
