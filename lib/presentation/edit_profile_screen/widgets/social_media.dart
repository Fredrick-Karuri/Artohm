import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/edit_profile_screen/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/edit_profile_model.dart';

class SocialMediaButton extends StatelessWidget {
  final SocialMedia socialMedia;
  final SocialMediaController controller;

  SocialMediaButton({required this.socialMedia, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0, right: 7.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface, // Replace with your desired color
        borderRadius: BorderRadius.circular(15.0), // Replace with your desired border radius
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            socialMedia.logoPath,
            height: 24.0,
            width: 24.0,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: EdgeInsets.only(top: 3.0, bottom: 2.0),
                      child: Text(
                        socialMedia.name,
                        style: TextStyle(fontSize: 16.0), // Replace with your desired style
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/share_icon.svg', // Replace with your share icon path
                      height: 24.0,
                      width: 22.0,
                    )
                  ]),
                  SizedBox(height: 18.0),
                  Text(
                    socialMedia.name,
                    style: TextStyle(fontSize: 14.0), // Replace with your desired style
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
