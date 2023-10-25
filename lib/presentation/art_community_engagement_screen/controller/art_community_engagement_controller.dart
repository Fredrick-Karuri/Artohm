import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/art_community_engagement_screen/models/art_community_engagement_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ArtCommunityEngagementScreen.
///
/// This class manages the state of the ArtCommunityEngagementScreen, including the
/// current artCommunityEngagementModelObj
class ArtCommunityEngagementController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<ArtCommunityEngagementModel> artCommunityEngagementModelObj =
      ArtCommunityEngagementModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
