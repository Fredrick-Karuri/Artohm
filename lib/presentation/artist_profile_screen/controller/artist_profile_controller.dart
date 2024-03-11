import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artist_profile_screen/models/artist_profile_model.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';

/// A controller class for the ArtistProfileScreen.
///
/// This class manages the state of the ArtistProfileScreen, including the
/// current artistProfileModelObj
///
// class ArtistController extends GetxController {
//   Rx<ArtistProfileModel> artistProfileModelObj = ArtistProfileModel(

//   ).obs;
// }

// class ArtistController extends GetxController {
//   late Rx<ArtistProfileModel> artist; // Observable Artist

//   ArtistController(ArtistProfileModel initialArtist) {
//     artist = initialArtist.obs; //convert the artist instance into an observable
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     fetchArtists();
//   }

//   Future<void> fetchArtists() async {
//     artists.assignAll(artists);
//   }
// }
class ArtistController extends GetxController {
  var artists = <ArtistProfileModel>[].obs;
  final List<ArtistProfileModel> initialArtists;
  final List<Artwork> allArtworks; // Add this line

  ArtistController(this.initialArtists, this.allArtworks); // Modify this line

  @override
  void onInit() {
    super.onInit();
    fetchArtists();
  }

  void fetchArtists() {
    artists.assignAll(initialArtists);

    // Add the following lines
    for (var artist in artists) {
      artist.assignArtworks(allArtworks);
    }
  }

  ArtistProfileModel getArtistByName(String name) {
    var artist = artists.firstWhere(
      (artist) => artist.name == name,
      orElse: () => ArtistProfileModel(
        id: 'no-artist-found',
        name: 'No Artist Found',
      ),
    );
    return artist;
  }

  void followArtist(ArtistProfileModel artist) {
    artist.isFollowed.value = true;
    artist.followsCount.value = artist.followsCount.value + 1;
  }

  void unFollowArtist(ArtistProfileModel artist) {
    artist.isFollowed.value = false;
    artist.followsCount.value = artist.followsCount.value - 1;
  }
}





// class ArtistController extends GetxController {
//   var artists = <ArtistProfileModel>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchArtists();
//   }
// void fetchArtists() {
//   artists.value = [
//     ArtistProfileModel(
//       id: uuid.v4(),
//       name: 'Sophia Anderson',
//       imageUrl: ImageConstant.imgEllipse1113x113,
//     ),
//     ArtistProfileModel(
//       id: uuid.v4(),
//       name: 'Mia Thomson',
//       imageUrl: ImageConstant.imgEllipse140x40,
//     ),
//     ArtistProfileModel(
//       id: uuid.v4(),
//       name: 'Oliver Reynolds',
//       imageUrl: ImageConstant.imgEllipse130x30,
//     ),
//     ArtistProfileModel(
//       id: uuid.v4(),
//       name: 'Tracy White',
//       imageUrl: ImageConstant.imgEllipse130x30,
//     ),
//   ];
// }


  // void fetchArtists() {
  //   // Here you would typically make your API call to fetch the artists
  //   // For now, we'll use the predefined list of artists
  //   artists.value = artists;
  // }
// }
