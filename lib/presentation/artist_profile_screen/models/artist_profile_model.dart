import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:uuid/uuid.dart';

/// This class defines the variables used in the [artist_profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ArtistProfileModel {
  final String id;
  final String name;
  String? imageUrl; //their profile image
  final double? followsCount;
  String? location;
  RxBool isFollowed = false.obs;
  List<Artwork>? artworks;

  ArtistProfileModel({
    required this.id,
    required this.name,
    this.imageUrl,
    this.followsCount,
    this.location,
    this.artworks,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'artworks': artworks!.map((artwork) => artwork.toJson()).toList(),
      'imageUrl': imageUrl,
      'followsCount': followsCount,
      'location': location,
    };
  }

  static ArtistProfileModel fromJson(Map<String, dynamic> json) {
    return ArtistProfileModel(
      id: json['id'],
      name: json['name'],
      artworks: (json['artworks'] as List)
          .map((artwork) => Artwork.fromJson(artwork))
          .toList(),
      imageUrl: json['imageUrl'],
      followsCount: json['followsCount'],
      location: json['location'],
    );
  }
}

var uuid = Uuid();
List<ArtistProfileModel> artists = [
  ArtistProfileModel(
      id: uuid.v4(),
      name: 'Sophia Anderson',
      imageUrl: ImageConstant.imgEllipse1113x113),
  ArtistProfileModel(
      id: uuid.v4(),
      name: 'Mia Thomson',
      imageUrl: ImageConstant.imgEllipse140x40),
  ArtistProfileModel(
      id: uuid.v4(),
      name: 'Oliver Reynolds',
      imageUrl: ImageConstant.imgEllipse130x30),
  ArtistProfileModel(
    id: uuid.v4(),
    imageUrl: ImageConstant.imgEllipse130x30,
    name: 'Tracy White',
  ),
];



// class ArtistProfileController extends GetxController {
//   final ArtistProfileApi api = ArtistProfileApi();
//   final artists = <ArtistProfileModel>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchArtists();
//   }

//   Future<void> fetchArtists() async {
//     try {
//       final fetchedArtists = await api.fetchArtists();
//       artists.assignAll(fetchedArtists);
//       update();
//     } catch (e) {
//       print(e);
//     }
//   }
// }

// class ArtistProfileView extends GetView<ArtistProfileController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Artist Profile'),
//       ),
//       body: Obx(
//         () => ListView.builder(
//           itemCount: controller.artists.length,
//           itemBuilder: (context, index) {
//             final artist = controller.artists[index];
//             return ListTile(
//               leading: CircleAvatar(
//                 backgroundImage: NetworkImage(artist.imageUrl!),
//               ),
//               title: Text(artist.name),
//               onTap: () async {
//                 await Get.toNamed(
//                   Routes.artistProfileDetails,
//                   arguments: artist,
//                 );
//                 controller.fetchArtists();
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

