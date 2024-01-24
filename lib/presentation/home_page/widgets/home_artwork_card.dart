import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/home_page/controller/home_controller.dart';
import 'package:artohmapp/presentation/home_page/models/home_model.dart';
import 'package:artohmapp/presentation/modal_screen/artwork_card_modal.dart';
import 'package:flutter/material.dart';


class HomeArtworkCard extends StatelessWidget {
  final String imagePath;
  final AnArtworkModel artwork;

  HomeArtworkCard({required this.imagePath, required this.artwork});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: SizedBox(
        height: 200.v,
        width: 160.h,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CustomImageView(
              imagePath: imagePath,
              height: 200.v,
              width: 160.h,
              radius: BorderRadius.circular(
                8.h,
              ),
              alignment: Alignment.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Obx(() => IconButton(
                      onPressed: () => controller.toggleFavorite(artwork), // Modify this line
                      icon: Icon(
                        artwork.isFavorited.value // Modify this line
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.white,
                        size: 24,
                      ),
                    )),
                IconButton(
                  onPressed: () {
                    ArtworkCardModalState.showModal(context);
                  },
                  icon: Icon(
                    Icons.more_vert_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
