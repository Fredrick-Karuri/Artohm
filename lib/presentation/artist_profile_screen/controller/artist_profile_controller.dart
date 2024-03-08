import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artist_profile_screen/models/artist_profile_model.dart';

/// A controller class for the ArtistProfileScreen.
///
/// This class manages the state of the ArtistProfileScreen, including the
/// current artistProfileModelObj
///
// class ArtistProfileController extends GetxController {
//   Rx<ArtistProfileModel> artistProfileModelObj = ArtistProfileModel(

//   ).obs;
// }

class ArtistProfileController extends GetxController {
  late Rx<ArtistProfileModel> artist; // Observable Artist

  ArtistProfileController(ArtistProfileModel initialArtist) {
    artist = initialArtist.obs; //convert the artist instance into an observable
  }

  @override
  void onInit() {
    super.onInit();
    fetchArtists();
  }

  Future<void> fetchArtists() async {
    artists.assignAll(artists);
  }
}
