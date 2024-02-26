import 'dart:convert';

import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/localStorage.dart';
import 'package:artohmapp/data/models/collections/collections_model.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:artohmapp/presentation/createcollection_screen/controller/createcollection_controller.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:uuid/uuid.dart';

class ArtworksController extends GetxController {
  var artworks = <Artwork>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchArtworks();
    
  }

  Future<void> fetchArtworks() async {
    artworks.assignAll(artworks);
  }

  // List<Artwork> get artworksList {
  //   return artworks;
  // }
}

Future<int> getArtworkCount() async {
  return artworks.length;
}

class FavoriteArtworksController extends GetxController {
  final ArtworksController artworksController; // Inject ArtworkController
  final LocalStorageService localStorageService; // Inject local storage service

  FavoriteArtworksController({
    required this.artworksController,
    required this.localStorageService,
  });

  @override
  void onInit() {
    super.onInit();
    loadFavoriteArtworks();
  }

  var favoriteArtworks = <Artwork>[].obs;

  void updateFavoriteArtworks() {
    favoriteArtworks.assignAll(
      artworksController.artworks.where((artwork) => artwork.isFavorite.value),
    );
    saveFavoriteArtworks();
  }

  List<Artwork> get favoriteArtworksList {
    return favoriteArtworks;
  }

  void saveFavoriteArtworks() {
    List<String> favoriteArtworksJson = favoriteArtworks
        .map((artwork) => jsonEncode(artwork.toJson()))
        .toList();

    localStorageService.setStringList('favoriteArtworks', favoriteArtworksJson);
  }

  void loadFavoriteArtworks() async {
    List<String>? favoriteArtworksJson =
        await localStorageService.getStringList('favoriteArtworks');
    if (favoriteArtworksJson != null) {
      favoriteArtworks.value = favoriteArtworksJson
          .map((artworkJson) => Artwork.fromJson(jsonDecode(artworkJson)))
          .toList();
    }
  }
}

// Future<void> fetchArtworks() async {
//   // Get a reference to the database
//   final db = await database;

//   // Query the table for all artworks
//   final List<Map<String, dynamic>> maps = await db.query('artworks');

//   // Convert the List<Map<String, dynamic> into a List<Artwork>.
//   List<Artwork> fetchedArtworks = List.generate(maps.length, (i) {
//     return Artwork(
//       id: maps[i]['id'], // Assign the unique ID from the database
//       title: maps[i]['title'],
//       artist: maps[i]['artist'],
//       description: maps[i]['description'],
//       category: maps[i]['category'],
//       type: maps[i]['type'],
//       comments: [], // You'll need to handle comments separately
//       imageUrl: maps[i]['imageUrl'],
//     );
//   });

//   artworks.assignAll(fetchedArtworks);
// }

// liked artworks controller
// class LikedArtworksController extends GetxController {
//   final ArtworksController artworksController; // Inject ArtworkController
//   final LocalStorageService localStorageService; // Inject local storage service
//   RxSet<String> _likedArtworksIds =
//       RxSet<String>(); // Initialize as empty RxSet<String>

//   // getter for _likedArtworksIds
//   List<String> get likedArtworksIds => _likedArtworksIds.toList();
//   RxList<Artwork> likedArtworks =
//       RxList<Artwork>(); // Observable list of liked artworks
//   RxInt likedCount = RxInt(0);

//   LikedArtworksController({
//     required this.artworksController,
//     required this.localStorageService,
//   }) {
//     _loadLikedArtworks();
//   }
//   Future<void> _loadLikedArtworks() async {
//     List<String>? likedArtworks =
//         await localStorageService.getStringList('liked_artworks');
//     if (likedArtworks != null) {
//       _likedArtworksIds.addAll(likedArtworks);
//     }
//     likedCount.value = _likedArtworksIds.length;
//     // print('Liked count: ${likedCount.value}'); // Add this line

//     updateLikedArtworks(); // Update the liked artworks list
//   }

//   void updateLikedArtworks() {
//     final artworks = artworksController.artworks.value;

//     likedArtworks.value = artworks
//         .where((artwork) => _likedArtworksIds.contains(artwork.id))
//         .toList();

//     likedCount.value = _likedArtworksIds.length;
//     print('Liked count: ${likedCount.value}');
//   }

//   Future<void> toggleLike(Artwork artwork) async {
//     if (_likedArtworksIds.contains(artwork.id)) {
//       _likedArtworksIds.remove(artwork.id);
//     } else {
//       _likedArtworksIds.add(artwork.id);
//     }
//     // print('Liked artworks IDs: $_likedArtworksIds'); // Add this line

//     await localStorageService.setStringList(
//         'liked_artworks', _likedArtworksIds.toList());
//     updateLikedArtworks(); // Update the liked artworks list
//     update();
//   }

//   bool isLiked(Artwork artwork) => _likedArtworksIds.contains(artwork.id);
// }

class CollectionsController extends GetxController {
  var collections = <Collection>[].obs;
  final LocalStorageService localStorageService;

  CollectionsController({required this.localStorageService});

  @override
  void onInit() {
    super.onInit();
    loadCollections();
  }
//  void createCollection(String name, {List<Artwork>? artworks, VisibilitySetting? visibility}) {
//   collections.add(Collection(
//     id: Uuid().v1(),
//     name: name,
//     artworks: artworks ?? [],  // Use an empty list if artworks is null
//     visibility: visibility ?? VisibilitySetting.Private,  // Use a default visibility if visibility is null
//   ));
//   saveCollections();
// }

  void createCollection(String name) {
    collections.add(
      Collection(
        id: Uuid().v1(),
        name: name,
        artworks: [],
      ),
    );
    saveCollections();
  }

  void addToCollection(String collectionId, Artwork artwork) {
    collections[collections
            .indexWhere((collection) => collection.id == collectionId)]
        .artworks
        .add(artwork);
    saveCollections();
  }

  void saveCollections() {
    List<String> collectionsJson = collections
        .map((collection) => jsonEncode(collection.toJson()))
        .toList();
    localStorageService.setStringList('collections', collectionsJson);
  }

  void loadCollections() async {
    List<String>? collectionsJson =
        await localStorageService.getStringList('collections');
    if (collectionsJson != null) {
      collections.value = collectionsJson
          .map((collectionJson) =>
              Collection.fromJson(jsonDecode(collectionJson)))
          .toList();
    }
  }

  void removeFromCollection(String collectionId, Artwork artwork) {
    collections[collections
            .indexWhere((collection) => collection.id == collectionId)]
        .artworks
        .remove(artwork);
    saveCollections();
  }
}

// Future<void> fetchArtworks() async {
//   // Replace with  logic to fetch from local storage or API
//   int artworkCount = await getArtworkCount();
//   List<Artwork> fetchedArtworks = List<Artwork>.generate(
//     artworkCount,

//     (index) => Artwork(
//       id: 'artwork-${index + 1}',
//       title: 'Artwork $index',
//       artist: 'Artist $index',
//       description: 'Description $index',
//       category: 'Category $index',
//       type: 'Type $index',
//       comments: [],
//       imageUrl:
//           'assets/images/artwork_$index.jpg', // Replace with your local paths
//     ),
//   );
//   artworks.assignAll(fetchedArtworks);
// }
