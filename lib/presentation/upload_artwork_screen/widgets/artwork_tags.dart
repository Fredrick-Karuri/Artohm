import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// class ArtworkTagSelection extends StatelessWidget {
//   final ArtworkTagController controller = Get.put(ArtworkTagController());
//   final List<String> predefinedTags = [
//     'Abstract',
//     'Realism',
//     'Impressionism',
//     'Expressionism',
//     'Surrealism'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 24),
//       child: Column(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Tags associated with the artwork',
//                 style: theme.textTheme.titleMedium,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
//                 child: TextField(
//                   focusNode: controller.inputTagFocusNode,
//                   controller: controller.inputTagController,
//                   decoration: InputDecoration(
//                     labelText: 'Add a tag',
//                     suffixIcon: IconButton(
//                       icon: Icon(Icons.add),
//                       onPressed: () {
//                         if (controller.inputTagController.text.isNotEmpty) {
//                           controller.selectedTags
//                               .add(controller.inputTagController.text);
//                           controller.inputTagController.clear();
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Wrap(
//             spacing: 8.0, // gap between adjacent chips
//             runSpacing: 4.0, // gap between lines
//             children: predefinedTags
//                 .map((tag) => Obx(() => FilterChip(
//                       label: Text(tag),
//                       selected: controller.selectedTags.contains(tag),
//                       onSelected: (bool selected) {
//                         if (selected) {
//                           controller.selectedTags.add(tag);
//                         } else {
//                           controller.selectedTags.remove(tag);
//                         }
//                       },
//                     )))
//                 .toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:multi_select_flutter/multi_select_flutter.dart';

class ArtworkTagController extends GetxController {
  TextEditingController inputTagController = TextEditingController();
  FocusNode inputTagFocusNode = FocusNode();

  void onClose() {
    super.onClose();
    inputTagController.dispose();
    inputTagFocusNode.dispose();
  }

  final predefinedTags = [
    'Abstract',
    'Realism',
    'Impressionism',
    'Expressionism',
    'Surrealism'
  ].obs;
  var selectedTags = <String>[].obs;
  var userAddedTags = <String>[].obs;

  void addUserTag(String tag) {
    if (tag.isNotEmpty && !predefinedTags.contains(tag)) {
      predefinedTags.add(tag);
      selectedTags.add(tag);
    }
  }
}

class ArtworkTagSelection extends StatelessWidget {
  final ArtworkTagController controller = Get.put(ArtworkTagController());
  // final _tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tags associated with the artwork',
                style: CustomTextStyles.titleSmall,
              ),
              SizedBox(height: 8),
              Obx(() {
                return Form(
                  child: Column(
                    children: [
                      MultiSelectChipField<String?>(
                        items: controller.predefinedTags
                            .map((tag) => MultiSelectItem<String>(tag, tag))
                            .toList(),
                        initialValue: controller.selectedTags.toList(),
                        onTap: (values) {
                          controller.selectedTags
                              .assignAll(values.cast<String>());
                        },
                        scrollBar: HorizontalScrollBar(),
                        showHeader: true,
                        headerColor:
                            theme.colorScheme.secondary.withOpacity(.08),
                        textStyle: CustomTextStyles.bodyMedium,
                        selectedChipColor:
                            theme.colorScheme.secondary.withOpacity(.6),
                        selectedTextStyle:
                            TextStyle(color: theme.colorScheme.background),
                        decoration: BoxDecoration(),
                        searchable: true,
                        validator: (values) {
                          if (values == null || values.isEmpty) {
                            return 'Please select at least one tag';
                          }
                          return null;
                        },
                      ),
                      TextField(
                        focusNode: controller.inputTagFocusNode,
                        controller: controller.inputTagController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              controller.addUserTag(
                                  controller.inputTagController.text);
                              controller.inputTagController.clear();
                            },
                          ),
                          labelText: "Add your own tag",
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
                      // MultiSelectChipField<String?>(
                      //   items: controller.predefinedTags
                      //       .map((tag) => MultiSelectItem<String?>(tag, tag))
                      //       .toList(),
                      //   initialValue: [],
                      //   title: Text(
                      //     "Tags",
                      //     style: CustomTextStyles.bodyLarge,
                      //   ),
                      //   showHeader: true,
                      //   headerColor: Theme.of(context).colorScheme.secondary,
                      //   selectedChipColor:
                      //       Theme.of(context).colorScheme.secondary,
                      //   selectedTextStyle:
                      //       TextStyle(color: theme.colorScheme.background),
                      //   onTap: (values) {
                      //     controller.selectedTags.value =
                      //         values.whereType<String>().toList();
                      //   },
                      // ),

              // Obx(() {
              //   return Form(
              //     child: MultiSelectChipField<String?>(
              //       items: controller.predefinedTags
              //           .map((tag) => MultiSelectItem<String>(tag, tag))
              //           .toList(),
              //       initialValue: controller.selectedTags.toList(),
              //       onSaved: (values) {
              //         if (values != null) {
              //           controller.selectedTags
              //               .assignAll(values.cast<String>());
              //         }
              //       },
              //       scrollBar: HorizontalScrollBar(),
              //       showHeader: true,
              //       decoration: BoxDecoration(),
              //       searchable: true,
              //       validator: (values) {
              //         if (values == null || values.isEmpty) {
              //           return 'Please select at least one tag';
              //         }
              //         return null;
              //       },
              //     ),
              //   );
              // }),