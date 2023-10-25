import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artist_profile_screen/models/artist_profile_model.dart';

/// A controller class for the ArtistProfileScreen.
///
/// This class manages the state of the ArtistProfileScreen, including the
/// current artistProfileModelObj
class ArtistProfileController extends GetxController {
  Rx<ArtistProfileModel> artistProfileModelObj = ArtistProfileModel().obs;
}
