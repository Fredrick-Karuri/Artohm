import 'package:artohmapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionController extends GetxController {
  var isExpanded = false.obs;
}

class DescriptionTile extends StatelessWidget {
  final String description;
  final DescriptionController controller = Get.put(DescriptionController());

  DescriptionTile({required this.description});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Get.theme.colorScheme.outline.withOpacity(.2),
            width: 1.0,
          ),
        ),
        child: ListTile(
            title: Text(
              'Description',
              style: CustomTextStyles.titleMedium,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  controller.isExpanded.value || description.length <= 300
                      ? description
                      : '${description.substring(0, 300)}...',
                  style: CustomTextStyles.bodyLarge,
                ),
                if (description.length > 300)
                  TextButton(
                    onPressed: () {
                      controller.isExpanded.toggle();
                    },
                    child: Text(controller.isExpanded.value
                        ? 'Show Less'
                        : 'Read More'),
                  ),
              ],
            )),
      );
    });
  }
}
