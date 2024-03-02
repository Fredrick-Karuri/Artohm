import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CollectionsModal extends StatelessWidget {
  final Artwork artwork;

  CollectionsModal({required this.artwork});

  void _showModal(BuildContext context, CollectionsController collectionsController) {
    String collectionName = '';
    showModalBottomSheet(
      backgroundColor: appTheme.pink50,
      context: context,
      isScrollControlled: true, // make the modal full screen
      builder: (context) {
        return SingleChildScrollView( // make the content scrollable
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom, // make space for the keyboard
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Collections',
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 4.0, // gap between lines
                      children: collectionsController.collections
                          .map((collection) => ActionChip(
                                backgroundColor: appTheme.whiteA700,
                                label: Text(collection.name),
                                onPressed: () {
                                  collectionsController.addToCollection(
                                      collection.id, artwork);
                                  Get.back();
                                },
                              ))
                          .toList(),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  onChanged: (value) {
                    collectionName = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'New Collection Name',
                  ),
                ),
                SizedBox(height: 16),
                CustomElevatedButton(
                  text: 'Create New Collection',
                  onTap: () {
                    collectionsController.createCollection(
                      collectionName,
                    );
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
        );
      },
    ).then((_) {
      if (Get.isDialogOpen!) {
        Get.back();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final CollectionsController collectionsController = Get.find();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showModal(context, collectionsController);
    });
    return Container(); // return an empty container
  }
}
