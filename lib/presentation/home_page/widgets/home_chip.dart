import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/theme_helper.dart';
import '../controller/chip_controller.dart';

class HomeChip extends StatelessWidget {
  final String labelText;
  final ChipController controller =
      Get.put(ChipController(), tag: UniqueKey().toString());

  HomeChip({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: controller.toggleChipSelection,
            child: Chip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color:
                      controller.isSelected.value ? Colors.black : Colors.blue,
                  width: 1.0,
                ),
              ),
              label: Text(
                labelText.tr,
              ),
              backgroundColor: controller.isSelected.value
                  ? appTheme.lightBlueA700
                  : appTheme.blue50,
              labelStyle: theme.textTheme.labelLarge!,
            ),
          ),
        ));
  }
}
