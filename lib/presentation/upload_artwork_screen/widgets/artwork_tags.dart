import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/upload_artwork_screen/controller/upload_artwork_controller.dart';
import 'package:artohmapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtworkTagSelection extends StatelessWidget {
  final ArtworkTagController controller = Get.put(ArtworkTagController());
  final List<String> predefinedTags = [
    'Abstract',
    'Realism',
    'Impressionism',
    'Expressionism',
    'Surrealism'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tags associated with the artwork',
                style: theme.textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: TextField(
                  focusNode: controller.inputTagFocusNode,
                  controller: controller.inputTagController,
                  decoration: InputDecoration(
                    labelText: 'Add a tag',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        if (controller.inputTagController.text.isNotEmpty) {
                          controller.selectedTags
                              .add(controller.inputTagController.text);
                          controller.inputTagController.clear();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            children: predefinedTags
                .map((tag) => Obx(() => FilterChip(
                      label: Text(tag),
                      selected: controller.selectedTags.contains(tag),
                      onSelected: (bool selected) {
                        if (selected) {
                          controller.selectedTags.add(tag);
                        } else {
                          controller.selectedTags.remove(tag);
                        }
                      },
                    )))
                .toList(),
          ),
        ],
      ),
    );
  }
}
