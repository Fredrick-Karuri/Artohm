import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:uuid/uuid.dart';

/// This class defines the variables used in the [artist_profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ArtistProfileModel {
  final String id;
  final String name;
  String? imageUrl; //their profile image
  String? bio; //bio of the artist
  RxInt followsCount = 0.obs; //make followsCount an observable int
  String? location;
  RxBool isFollowed = false.obs;
  List<Artwork>? artworks;
  List<UpcomingEvent>? upcomingEvents;

  ArtistProfileModel({
    required this.id,
    required this.name,
    this.imageUrl,
    this.bio,
    int? followsCount,
    this.location,
    this.artworks,
    // this.upcomingEvents,
  }) {
    this.followsCount.value = followsCount ?? 0;
  }

  void assignArtworks(List<Artwork> allArtworks) {
    this.artworks =
        allArtworks.where((artwork) => artwork.artist == this.name).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'bio': bio,
      'artworks': artworks!.map((artwork) => artwork.toJson()).toList(),
      'imageUrl': imageUrl,
      'followsCount': followsCount,
      'location': location,
      // 'upcomingEvents': upcomingEvents!.map((event) => event.toJson()).toList(),
    };
  }

  static ArtistProfileModel fromJson(Map<String, dynamic> json) {
    return ArtistProfileModel(
      id: json['id'],
      name: json['name'],
      bio: json['bio'],
      artworks: (json['artworks'] as List)
          .map((artwork) => Artwork.fromJson(artwork))
          .toList(),
      imageUrl: json['imageUrl'],
      followsCount: json['followsCount'],
      location: json['location'],
      // upcomingEvents: (json['upcomingEvents'] as List)
      //     .map((event) => UpcomingEvent.fromJson(event))
      //     .toList(),
    );
  }
}

var uuid = Uuid();
List<ArtistProfileModel> artists = [
  ArtistProfileModel(
      id: uuid.v4(),
      name: 'Sophia Anderson',
      imageUrl: ImageConstant.imgEllipse1113x113,
      // upcomingEvents: upcomingEvents,
      bio:
          "Sophia Anderson is an American visual artist, illustrator, and filmmaker whose work often explores the relationship between humans and technology, as well as the intersection of nature and culture."),

  ArtistProfileModel(
      id: uuid.v4(),
      name: 'Mia Thomson',
      imageUrl: ImageConstant.imgEllipse140x40,
      // upcomingEvents: upcomingEvents,
      bio:
          "Mia Thomson is an American visual artist, based in Brooklyn, New York. She is known for her large-scale, colorful paintings that reference popular culture, science fiction, and fantasy."),
  ArtistProfileModel(
      id: uuid.v4(),
      name: 'Oliver Reynolds',
      imageUrl: ImageConstant.imgEllipse130x30,
      bio:
          "Oliver Reynolds is an American photographer based in Los Angeles, California. He is known for his portraits of celebrities, musicians, and other notable figures."),
  ArtistProfileModel(
    id: uuid.v4(),
    imageUrl: ImageConstant.imgEllipse130x30,
    name: 'Tracy White',
    bio:
        "Tracy White is an American photographer, based in Los Angeles, California. He is known for his fashion and portrait photography, and has worked with numerous high-profile clients such as Kanye West, Kim Kardashian, and Madonna.",
  ),
];

class UpcomingEvent {
  final String id;
  final String artistId;
  final String title;
  final String description;
  final DateTime eventDate;
  final String location;
  final String? imageUrl; // Add this field

  UpcomingEvent({
    required this.id,
    required this.artistId,
    required this.title,
    required this.description,
    required this.eventDate,
    required this.location,
    this.imageUrl, // And this parameter
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'artistId': artistId,
      'title': title,
      'description': description,
      'eventDate': eventDate.toIso8601String(),
      'location': location,
      'imageUrl': imageUrl, // And this line
    };
  }

  factory UpcomingEvent.fromJson(Map<String, dynamic> json) {
    return UpcomingEvent(
      id: json['id'],
      artistId: json['artistId'],
      title: json['title'],
      description: json['description'],
      eventDate: DateTime.parse(json['eventDate']),
      location: json['location'],
      imageUrl: json['imageUrl'], // And this line
    );
  }
}


RxList<UpcomingEvent> upcomingEvents = RxList<UpcomingEvent>([
  UpcomingEvent(
    id: uuid.v4(),
    artistId: artists[0].id,
    title: 'Art Exhibition',
    description: 'An exhibition featuring new works by Sophia Anderson.',
    eventDate: DateTime(2024, 4, 10),
    location: 'Art Gallery, Nairobi',
    imageUrl: ImageConstant.imgRectangle11120x1602
    
  ),
  UpcomingEvent(
    id: uuid.v4(),
    artistId: artists[1].id,
    title: 'Photography Workshop',
    description: 'A workshop on portrait photography by Oliver Reynolds.',
    eventDate: DateTime(2024, 5, 10),
    location: 'Photography Studio, Nairobi',
    imageUrl: ImageConstant.imgRectangle11120x1601
  ),
  UpcomingEvent(
    id: uuid.v4(),
    artistId: artists[2].id,
    title: 'Art Auction',
    description: 'An auction of artworks by various artists.',
    eventDate: DateTime(2024, 6, 10),
    location: 'Auction House, Nairobi',
    imageUrl: ImageConstant.imgRectangle11120x160
  ),
  UpcomingEvent(
    id: uuid.v4(),
    artistId: artists[3].id,
    title: 'Fashion Show',
    description: 'A fashion show featuring celebrities and musicians.',
    eventDate: DateTime(2024, 7, 10),
    location: 'Fashion Studio, Nairobi',
    imageUrl: ImageConstant.imgRectangle11120x160
  ),
  UpcomingEvent(
    id: uuid.v4(),
    artistId: artists[4].id,
    title: 'Art Show',
    description: 'An art show featuring new works by Tracy White.',
    eventDate: DateTime(2024, 8, 10),
    location: 'Art Studio, Nairobi',
    imageUrl: ImageConstant.imgRectangle11120x1601
  ),

]);









// class ArtistController extends GetxController {
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

// class ArtistProfileView extends GetView<ArtistController> {
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

