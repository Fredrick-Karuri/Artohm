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
}

// List<Artwork> get artworksList {
//   return artworks;
// }

Future<int> getArtworkCount() async {
  return artworks.length;
}

class FavoriteArtworksController extends GetxController {
  RxList<Artwork> favoriteArtworks = <Artwork>[].obs;

  // var favoriteArtworks = <Artwork>[].obs;
  // function to add artwork to the favorite list
  void addToFavoriteList(Artwork artwork) {
    if (!isFavorite(artwork)) {
      favoriteArtworks.add(artwork);
    }
  }

  // function to remove artwork from the favorite list
  void removeFromFavoriteList(Artwork artwork) {
    favoriteArtworks.remove(artwork);
  }

  bool isFavorite(Artwork artwork) {
    return favoriteArtworks.contains(artwork);
  }

  // function to toggle the favorite status
  void toggleFavorite(Artwork artwork) {
    artwork.isFavorite.toggle();
    isFavorite(artwork)
        ? removeFromFavoriteList(artwork)
        : addToFavoriteList(artwork);
  }
}

// class FavoriteArtworksController extends GetxController {
//   final ArtworksController artworksController; // Inject ArtworkController
//   final LocalStorageService localStorageService; // Inject local storage service

//   FavoriteArtworksController({
//     required this.artworksController,
//     required this.localStorageService,
//   });

//   @override
//   void onInit() {
//     super.onInit();
//     loadFavoriteArtworks();
//   }

//   var favoriteArtworks = <Artwork>[].obs;

//   void updateFavoriteArtworks() {
//     favoriteArtworks.assignAll(
//       artworksController.artworks.where((artwork) => artwork.isFavorite.value),
//     );
//     saveFavoriteArtworks();
//   }

//   List<Artwork> get favoriteArtworksList {
//     return favoriteArtworks;
//   }

//   void saveFavoriteArtworks() {
//     List<String> favoriteArtworksJson = favoriteArtworks
//         .map((artwork) => jsonEncode(artwork.toJson()))
//         .toList();

//     localStorageService.setStringList('favoriteArtworks', favoriteArtworksJson);
//   }

//   void loadFavoriteArtworks() async {
//     List<String>? favoriteArtworksJson =
//         await localStorageService.getStringList('favoriteArtworks');
//     if (favoriteArtworksJson != null) {
//       favoriteArtworks.value = favoriteArtworksJson
//           .map((artworkJson) => Artwork.fromJson(jsonDecode(artworkJson)))
//           .toList();
//     }
//   }
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

  String? createCollection(String name,
      {VisibilitySetting visibility = VisibilitySetting.Private}) {
    if (name.trim().isEmpty) {
      return 'Collection name cannot be empty';
    } else if (collections.any((collection) => collection.name == name)) {
      return 'Collection name already exists';
    } else {
      collections.add(
        Collection(
          id: Uuid().v1(),
          name: name,
          visibility: visibility,
          artworks: [],
        ),
      );
      saveCollections();
      return null;
    }
  }

  void deleteCollection(String collectionId) {
    collections.removeWhere((collection) => collection.id == collectionId);
    saveCollections();
  }

  bool addToCollection(String collectionId, Artwork artwork) {
    var collectionIndex =
        collections.indexWhere((collection) => collection.id == collectionId);
    bool alreadyExist = collections[collectionIndex]
        .artworks
        .any((existingArtwork) => existingArtwork.id == artwork.id);
    if (!alreadyExist) {
      collections[collectionIndex].artworks.add(artwork);
      saveCollections();
      return true;
    } else {
      return false;
    }
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

      // Sort collections by name
      collections.sort((a, b) => a.name.compareTo(b.name));
    }
  }

  void removeFromCollection(String collectionId, Artwork artwork) {
    collections[collections
            .indexWhere((collection) => collection.id == collectionId)]
        .artworks
        .remove(artwork);
    saveCollections();
  }

  bool isArtworkInCollection(String collectionId, String artworkId) {
    var collectionIndex =
        collections.indexWhere((collection) => collection.id == collectionId);
    return collections[collectionIndex]
        .artworks
        .any((existingArtwork) => existingArtwork.id == artworkId);
  }
}
