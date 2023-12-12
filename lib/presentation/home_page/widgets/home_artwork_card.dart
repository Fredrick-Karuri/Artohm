import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/modal_screen/artwork_card_modal.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_image_view.dart';

class HomeArtworkCard extends StatelessWidget {
  final String imagePath;

  HomeArtworkCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
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
            IconButton(
              onPressed: () {
                ArtworkCardModalState.showModal(context);
              },
              icon: Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
