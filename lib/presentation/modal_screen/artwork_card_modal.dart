
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

class ArtworkCardModal extends StatefulWidget {
  const ArtworkCardModal({Key? key}) : super(key: key);

  @override
  ArtworkCardModalState createState() => ArtworkCardModalState();
}

class ArtworkCardModalState extends State<ArtworkCardModal> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => showModal(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFEE9E9),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              border: Border.all(
                color: Color.fromRGBO(245, 140, 140, 0.075),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  blurRadius: 4.0,
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 13.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Artwork Name",
                          style: theme.textTheme.titleMedium),
                      Row(
                        children: [
                          Icon(Icons.favorite_border),
                          Text("120",
                              style: theme.textTheme.bodyMedium,
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          // Get.back();
                          Get.toNamed(AppRoutes.artworkScreen);
                          
                        },
                        icon: Icon(Icons.info_outline),
                        label: Text(
                          'View Artwork Info',
                          style: CustomTextStyles.titleSmallLatoBlack90001,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.collections),
                        label: Text(
                          'Add to Collections',
                          style: CustomTextStyles.titleSmallLatoBlack90001,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
