import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artwork_screen/artwork_screen.dart';
import 'package:artohmapp/presentation/artwork_screen/binding/artwork_binding.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteArtworksView extends GetView<FavoriteArtworksController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Text(
              'Liked Artworks (${controller.favoriteArtworks.length})',
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 10.0),
          Obx(
            () {
              if (controller.favoriteArtworks.isEmpty) {
                return Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: theme.colorScheme.outline,
                        width: 1.0,
                      ),
                    ),
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
      
                    
                    child: Text(
                      'You have not liked any artworks yet.',
                      style: theme.textTheme.bodyLarge !.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  ),
                );
              } else {
                return Container(
                  height: 220.0,
                  child: ListView.builder(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.favoriteArtworks.length,
                    itemBuilder: (context, index) {
                      Artwork artwork = controller.favoriteArtworks[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => ArtworkScreen(),
                              arguments: artwork, binding: ArtworkBinding());
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10.0),
                          width: 160.0,
                          child: Column(
                            children: [
                              Image.asset(
                                artwork.imageUrl,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                artwork.title,
                                style: theme.textTheme.titleSmall!.copyWith(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}



// class FavoriteArtworksView extends StatelessWidget {
//   final ArtworksController artworksController = Get.find();
//   final FavoriteArtworksController favoriteArtworksController = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return Column(
//         children: [
//           Text('Liked Artworks (${favoriteArtworksController.favoriteArtworksList.length})',),
//           Container(
//             height: 200.0,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: favoriteArtworksController.favoriteArtworksList.length,
//               itemBuilder: (context, index) {
//                 final artwork = favoriteArtworksController.favoriteArtworksList[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: <Widget>[
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(8.0),
//                         child: Image.asset(
//                           artwork.imageUrl,
//                           width: 160.0,
//                           height: 120.0,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       SizedBox(height: 6.0),
//                       Text(
//                         artwork.title,
//                         style:
//                             TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
//                       ),
//                       Text(
//                         'by ${artwork.artist}',
//                         style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }


