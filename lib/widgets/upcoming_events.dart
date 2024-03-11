import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artist_profile_screen/models/artist_profile_model.dart';
import 'package:artohmapp/presentation/modal_screen/modal_screen.dart';
import 'package:flutter/material.dart';

class UpcomingEventsCard extends StatelessWidget {
  final UpcomingEvent event;

  UpcomingEventsCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: EdgeInsets.only(right: 16),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: event.imageUrl ?? '', // Use the imageUrl from the event
            radius: BorderRadius.circular(8.h),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 4.v),
              decoration: AppDecoration.fillPrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderBL8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      event.title, // Use the title from the event
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.labelLargeWhite
                          .copyWith(height: 1.40),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ModalScreenState.showModal(context);
                    },
                    icon: Icon(Icons.more_vert),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
