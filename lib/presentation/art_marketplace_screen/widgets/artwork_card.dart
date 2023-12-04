import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/theme_helper.dart';
import '../models/artwork_card_model.dart';

class CustomCardWidget extends StatelessWidget {
  final CustomCard card;

  CustomCardWidget({required this.card});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 200.v,
            width: 176.h,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CustomImageView(
                  fit: BoxFit.fill,
                  imagePath: card.imagePath,
                  radius: BorderRadius.circular(8.h),
                  alignment: Alignment.center,
                ),
                InkWell(
                  onTap: (){
                    showModal(context);
                  },
                  child: CustomImageView(
                    svgPath: card.svgPath,
                    height: 20.v,
                    width: 4.h,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(right: 18.h, bottom: 10.v),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.v),
          Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(card.title.tr, style: theme.textTheme.titleSmall),
                    SizedBox(height: 6.v),
                    Text(card.artist.tr, style: theme.textTheme.bodyMedium),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.v),
                  decoration: AppDecoration.outlinePrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder4),
                  child: Text(card.price.tr, style: theme.textTheme.labelMedium),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: FractionallySizedBox(
          widthFactor: 0.94,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Title',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    _buildRow(Icons.info, 'View Artwork Info', () {}),
                    _buildRow(Icons.favorite, 'Like', () {}),
                    _buildRow(Icons.add, 'Add to Collection', () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildRow(IconData icon, String label, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Row(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onTap,
        ),
        Text(label),
      ],
    ),
  );
}

