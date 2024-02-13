import 'package:artohmapp/presentation/home_page/controller/home_controller.dart';
import 'package:artohmapp/presentation/home_page/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/theme_helper.dart';

class HomeChip extends StatelessWidget {
  final HomeChipFilterModel chip;
  final HomeController controller = Get.find();

  HomeChip({
    Key? key,
    required this.chip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(right: 10),
        child: GestureDetector(
          // onTap: () => controller.toggleChipSelection(chip.id.value),
          onTap: () {
            if (chip.isSelected.value) {
              // Clear the filter if the chip is selected
              controller.clearFilter();
            } else {
              controller.toggleChipSelection(chip.id.value);
            }
          },
          child: Chip(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: chip.isSelected.value ? Colors.black : Colors.blue,
                width: 1.0,
              ),
            ),
            label: Text(
              chip.label.value,
            ),
            avatar: chip.isSelected.value
                ? GestureDetector(
                    onTap: () {
                      controller.clearFilter();
                    },
                    child: Icon(
                      Icons.close,
                    ),
                  )
                : null,
            backgroundColor: chip.isSelected.value
                ? appTheme.lightBlueA700
                : appTheme.blue50,
            labelStyle: theme.textTheme.labelLarge!.copyWith(
              color: chip.isSelected.value ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
