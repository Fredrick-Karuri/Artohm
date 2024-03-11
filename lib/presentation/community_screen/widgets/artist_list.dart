import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artist_profile_screen/controller/artist_profile_controller.dart';
import 'package:artohmapp/presentation/artist_profile_screen/models/artist_profile_model.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:flutter/material.dart';

class ArtistList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Find the instance of ArtworksController, or lazily create and register it if not found
    // Get.lazyPut<ArtworksController>(() => ArtworksController());
    // Get.find<ArtworksController>();
    try {
      Get.find<ArtworksController>();
    } catch (e) {
      Get.lazyPut<ArtworksController>(() => ArtworksController());
    }
    return GetBuilder<ArtistController>(
      init: ArtistController(artists, artworks),
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(left: 16.h, top: 32.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Artists",
                style: CustomTextStyles.titleMedium,
              ),
              SizedBox(height: 16),
              Container(
                height: 160.v,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.artists.length,
                  itemBuilder: (context, index) {
                    final artist = controller.artists[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.artistProfileScreen,
                            arguments: artist);
                      },
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 140),
                        child: Card(
                          color: theme.colorScheme.background,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Column(
                              children: [
                                Image.asset(
                                  artist.imageUrl!,
                                  width: 96,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  artist.name,
                                  style: CustomTextStyles.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
