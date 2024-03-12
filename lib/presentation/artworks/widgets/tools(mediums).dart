import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class MediumsController extends GetxController {
  final mediums = [
    'Acrylic',
    'Oil',
    'Watercolor',
    'Digital',
    'Pencil',
    'Charcoal',
    'Pastel',
    'Ink',
    'Aergraph',
    'Lithograph',
    'Collage',
    'Mixed media',
    'Printmaking',
    'Sculpture',
    'Textile arts',
    'Installation art',
    'Performance art',
  ].obs;
  var selectedMediums = <String>[].obs;
}


class MediumsView extends StatelessWidget {
  final MediumsController controller = Get.put(MediumsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Medium",
                style: CustomTextStyles.titleSmall,
              ),
              SizedBox(width: 8.h),
              Text("(How was your piece made?)",
                  style: theme.textTheme.bodyMedium),
            ],
          ),
          Obx(() {
            return MultiSelectDialogField(
              items: controller.mediums
                  .map((medium) => MultiSelectItem(medium, medium))
                  .toList(),
              listType: MultiSelectListType.CHIP,
              onConfirm: (values) {
                controller.selectedMediums.value = values.cast<String>();
              },
            );
          }),
        ],
      ),
    );
  }
}
