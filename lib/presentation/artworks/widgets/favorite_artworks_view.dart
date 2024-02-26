import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteArtworksView extends GetView<FavoriteArtworksController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Text('Liked Artworks (${controller.favoriteArtworks.length})'),
        ),
        Obx(
          () => ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.favoriteArtworks.length,
            itemBuilder: (context, index) {
              Artwork artwork = controller.favoriteArtworks[index];
              return ListTile(
                title: Text(artwork.title),
                // Add more details about the artwork here
              );
            },
          ),
        ),
      ],
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


