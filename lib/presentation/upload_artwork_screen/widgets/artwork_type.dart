import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/upload_artwork_screen/controller/upload_artwork_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtworkTypeSelection extends StatelessWidget {
  final ArtworkTypeController controller = Get.put(ArtworkTypeController());
  final List<String> artworkTypes = [
    'Art',
    'Photograph',
    'Sculpture',
    'Painting'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Type of Artwork',
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(
            height: 8.0,
          ),
          Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            children: artworkTypes
                .map(
                  (type) => Obx(
                    () => ChoiceChip(
                      label: Text(
                        type,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: controller.selectedArtworkType.value == type
                              ? theme.colorScheme.onBackground
                              : theme.colorScheme.secondary,
                        ),
                      ),
                      selected: controller.selectedArtworkType.value == type,
                      onSelected: (bool selected) {
                        controller.selectedArtworkType.value =
                            selected ? type : '';
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
