import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/community_screen/models/art_community_model.dart';

/// A controller class for the ArtCommunityScreen.
///
/// This class manages the state of the ArtCommunityScreen, including the
/// current artCommunityModelObj
class ArtCommunityController extends GetxController {
  Rx<ArtCommunityModel> artCommunityModelObj = ArtCommunityModel().obs;
}
