import 'package:artohmapp/presentation/artist_profile_screen/models/artist_profile_model.dart';
import 'package:artohmapp/presentation/artwork_screen/artwork_screen.dart';
import 'package:artohmapp/presentation/artwork_screen/binding/artwork_binding.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/modal_screen/modal_screen.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:artohmapp/widgets/upcoming_events.dart';

import '../../widgets/custom_appbar_component.dart';
import 'controller/artist_profile_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// class ArtistProfileScreen extends StatelessWidget {
//   final ArtistProfileModel artist;

//   ArtistProfileScreen({required this.artist});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(artist.name),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (artist.imageUrl != null) Image.asset(artist.imageUrl!),
//               SizedBox(height: 16),
//               Text(
//                 artist.name,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 8),
//               if (artist.location != null)
//                 Text(
//                   'Location: ${artist.location}',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               SizedBox(height: 8),
//               if (artist.followsCount != null)
//                 Text(
//                   'Followers: ${artist.followsCount}',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               SizedBox(height: 16),
//               Text(
//                 'Artworks:',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 8),
//               for (var artwork in artist.artworks ?? [])
//                 ListTile(
//                   leading: Image.asset(artwork.imageUrl),
//                   title: Text(artwork.title),
//                   subtitle: Text('By ${artwork.artist}'),
//                   onTap: () {
//                     Get.to(() => ArtworkScreen(),
//                         arguments: artwork, binding: ArtworkBinding());
//                   },
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class ArtistProfileScreen extends StatelessWidget {
  final ArtistProfileModel artist;
  // artist controller

  ArtistProfileScreen({required this.artist});
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar:
          CustomAppBarComponent(onBackPressed: Get.back, title: artist.name),
      body: bodyContent(context));

  Widget bodyContent(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            aboutArtist(artist),
            artworks(artist),
            // events(),
          ],
        ),
      );

   events() {
    Obx(() {
      return ListView.builder(
        itemCount: upcomingEvents.length,
        itemBuilder: (context, index) {
          return UpcomingEventsCard(event: upcomingEvents[index]);
        },
      );
    });
  }

  Widget aboutArtist(artist) {
    Get.lazyPut<ArtistController>(() =>
        ArtistController(artists, Get.find<ArtworksController>().artworks));
    ArtistController artistController = Get.find();
    return Container(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Column(
        children: [
          if (artist.imageUrl != null)
            Image.asset(
              artist.imageUrl!,
              height: 120.adaptSize,
              width: 120.adaptSize,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          SizedBox(height: 18.v),
          Align(
            alignment: Alignment.center,
            child: Text(
              artist.name,
              style: theme.textTheme.titleMedium,
            ),
          ),
          if (artist.bio != null)
            Container(
              margin: EdgeInsets.only(left: 45.h, top: 9.v, right: 60.h),
              child: Text(
                artist.bio!,
                // "msg_a_nature_enthusiast".tr,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodyLarge.copyWith(
                  height: 1.50,
                ),
              ),
            ),
          SizedBox(height: 12.v),
          Obx(
            () => artist.isFollowed.value
                ? CustomElevatedButton(
                    buttonStyle: CustomButtonStyles.fillPrimaryButtonRounded,
                    text: "Following",
                    alignment: Alignment.center,
                    onTap: () {
                      artistController.unFollowArtist(artist);
                    },
                  )
                : CustomOutlinedButton(
                    text: "Follow",
                    alignment: Alignment.center,
                    onTap: () {
                      artistController.followArtist(artist);
                    },
                  ),
          )
        ],
      ),
    );
  }

  Widget artworks(artist) {
    if (artist.artworks == null || artist.artworks!.isEmpty) return Container();
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 21.v),
          Text(
            'From ${artist.name}',
            style: CustomTextStyles.titleMedium,
          ),
          SizedBox(height: 15.v),
          SizedBox(
            height: 240.v,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: artist.artworks!.length,
              itemBuilder: (context, index) {
                var artwork = artist.artworks![index];
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ArtworkScreen(),
                            arguments: artwork, binding: ArtworkBinding());
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Image.asset(
                              artwork.imageUrl,
                              height: 210.v,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 4),
                            Text(
                              artwork.title,
                              style: CustomTextStyles.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // bodyContent(BuildContext context) {
  //   return SizedBox(
  //     width: mediaQueryData.size.width,
  //     child: SingleChildScrollView(
  //       padding: EdgeInsets.only(top: 16.v, bottom: 32.v),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           aboutArtist(artist),
  //           artworks(artist),
  //           events(context),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // eventss(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SizedBox(height: 24.v),
  //         Text("msg_upcoming_events".tr, style: theme.textTheme.titleMedium),
  //         SizedBox(height: 16.v),
  //         SingleChildScrollView(
  //           scrollDirection: Axis.horizontal,
  //           child: IntrinsicWidth(
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 UpcomingEventsCard(
  //                   onTap: () {
  //                     ModalScreenState.showModal(context);
  //                   },
  //                   imagePath: ImageConstant.imgRectangle11200x260,
  //                   text: "msg_art_unveiling_exploring".tr,
  //                 ),
  //                 UpcomingEventsCard(
  //                   onTap: () {
  //                     ModalScreenState.showModal(context);
  //                   },
  //                   imagePath: ImageConstant.imgRectangle11200x260,
  //                   text: "msg_art_unveiling_exploring".tr,
  //                 ),
  //                 UpcomingEventsCard(
  //                   onTap: () {
  //                     ModalScreenState.showModal(context);
  //                   },
  //                   imagePath: ImageConstant.imgRectangle11200x260,
  //                   text: "msg_art_unveiling_exploring".tr,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // aboutArtist(artist) {
  //   Get.lazyPut<ArtistController>(() =>
  //       ArtistController(artists, Get.find<ArtworksController>().artworks));
  //   ArtistController artistController = Get.find();
  //   return Container(
  //     padding: const EdgeInsets.only(right: 16, left: 16),
  //     child: Column(
  //       children: [
  //         if (artist.imageUrl != null)
  //           Image.asset(
  //             artist.imageUrl!,
  //             height: 120.adaptSize,
  //             width: 120.adaptSize,
  //             fit: BoxFit.cover,
  //             alignment: Alignment.center,
  //           ),
  //         SizedBox(height: 18.v),
  //         Align(
  //           alignment: Alignment.center,
  //           child: Text(
  //             artist.name,
  //             style: theme.textTheme.titleMedium,
  //           ),
  //         ),
  //         if (artist.bio != null)
  //           Container(
  //             margin: EdgeInsets.only(left: 45.h, top: 9.v, right: 60.h),
  //             child: Text(
  //               artist.bio!,
  //               // "msg_a_nature_enthusiast".tr,
  //               maxLines: 3,
  //               overflow: TextOverflow.ellipsis,
  //               style: CustomTextStyles.bodyLarge.copyWith(
  //                 height: 1.50,
  //               ),
  //             ),
  //           ),
  //         SizedBox(height: 12.v),
  //         Obx(
  //           () => artist.isFollowed.value
  //               ? CustomElevatedButton(
  //                   buttonStyle: CustomButtonStyles.fillPrimaryButtonRounded,
  //                   text: "Following",
  //                   alignment: Alignment.center,
  //                   onTap: () {
  //                     artistController.unFollowArtist(artist);
  //                   },
  //                 )
  //               : CustomOutlinedButton(
  //                   text: "Follow",
  //                   alignment: Alignment.center,
  //                   onTap: () {
  //                     artistController.followArtist(artist);
  //                   },
  //                 ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }

  /// Navigates to the artworkScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artworkScreen.
  onTapImgImageoneoneone() {
    Get.toNamed(
      AppRoutes.artworkScreen,
    );
  }

  /// Navigates to the artworkScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artworkScreen.
  onTapImgImageoneoneone1() {
    Get.toNamed(
      AppRoutes.artworkScreen,
    );
  }

  /// Navigates to the modalScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the modalScreen.
  ///
  // onTapImgIconssevenone() {
  //   Get.toNamed(
  //     AppRoutes.modalScreen,

  //   );
  // }
}
