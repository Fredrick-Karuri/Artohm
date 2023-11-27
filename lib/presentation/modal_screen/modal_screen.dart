// not being used currently
import 'controller/modal_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ModalScreen extends StatefulWidget {
  const ModalScreen({Key? key}) : super(key: key);

  @override
  _ModalScreenState createState() => _ModalScreenState();
}

class _ModalScreenState extends State<ModalScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to ensure ModalScreen is built before showing the modal
    Future.delayed(Duration.zero, () => showModal(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Empty container
  }


  void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Container(
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
              CustomElevatedButton(
                text: "lbl_book_ticket".tr,
                margin: EdgeInsets.only(
                  left: 16.h,
                  right: 16.h,
                  bottom: 24.v,
                ),
                buttonTextStyle: CustomTextStyles.titleSmallRobotoWhiteA700,
              ),
            ],
          ),
        );
      },
    );
  }
}
