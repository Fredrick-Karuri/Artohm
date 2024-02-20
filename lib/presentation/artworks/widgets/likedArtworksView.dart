import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/home_page/widgets/homeArtworkCard.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:flutter/material.dart';
class LikedArtworksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LikedArtworksController controller = Get.find(); // Get the instance of LikedArtworksController

    return Obx(() {
      final likedArtworks = controller.likedArtworks;
      print('Number of liked artworks: ${likedArtworks.length}');

      print('Liked artworks: $likedArtworks');
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Liked Artworks (${controller.likedCount.value})',
            style: theme.textTheme.titleMedium,
          ), // Title with count
          SizedBox(height: 12.v),
          Container(
            height: 160.v,
            child: 
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller
                  .likedArtworks.length, // Use the length from the controller
              itemBuilder: (context, index) {
                final artwork = controller.likedArtworks[index];
                print(
                    'Rendering artwork at index $index with ID ${artwork.id}');

                return HomeArtworkCardNew(
                  artwork: artwork,
                );
              },
            ),
          ),
        ],
      );
    });
  }
}

  // return Obx(
  //   () {
  //     final likedArtworks = controller.likedArtworks;
  //     print('Number of liked artworks: ${likedArtworks.length}');

  //     print('Liked artworks: $likedArtworks');
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'Liked Artworks (${controller.likedCount.value})',
  //           style: theme.textTheme.titleMedium,
  //         ), // Title with count
  //         SizedBox(height: 12.v),
  //         Container(
  //           height: 160.v,
  //           child: ListView.builder(
  //             scrollDirection: Axis.horizontal,
  //             itemCount: min(6, likedArtworks.length + 1),
  //             itemBuilder: (context, index) {
  //               if (index < 5 && index < likedArtworks.length) {
  //                 print(
  //                     'Rendering artwork at index $index with ID ${likedArtworks[index].id}');

  //                 return HomeArtworkCardNew(
  //                   artwork: likedArtworks[index],
  //                   likedArtworksController: controller,
  //                 );
  //               } else {
  //                 return Card(
  //                   child: IconButton(
  //                     icon: Icon(Icons.add),
  //                     onPressed: () {
  //                       // Handle "View More" press
  //                     },
  //                   ),
  //                 );
  //               }
  //             },
  //           ),
  //         ),
  //       ],
  //     );
  //   },
  // );

