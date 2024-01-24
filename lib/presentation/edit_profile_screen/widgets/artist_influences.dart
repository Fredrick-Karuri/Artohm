import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/edit_profile_screen/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';

class InfluencesView extends StatelessWidget {
  final InfluencesController controller;

  InfluencesView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("lbl_your_influences".tr, style: theme.textTheme.titleSmall),
        // Obx(() {
        //   return
        Autocomplete<String>(
      
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            }
            return controller.artistsList.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            print('You just selected $selection');
            controller.selectedArtists.add(selection);
            // },
            // );
          },
        ),
        Obx(() {
          return Wrap(
            spacing: 6.0,
            // runSpacing: 3.0,
            children: controller.selectedArtists.map((String artist) {
              return Chip(
                label: Text(artist),
                // backgroundColor: Theme.of(context).colorScheme.primary, // Use your theme color here
                backgroundColor: theme.primaryColorDark,

                deleteIconColor: Colors.white, // Change as needed
                labelStyle: TextStyle(color: Colors.white), // Change as needed
                onDeleted: () {
                  controller.selectedArtists.remove(artist);
                },
              );
            }).toList(),
          );
        }),
      ],
    );
  }
}
