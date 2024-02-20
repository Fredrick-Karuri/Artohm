import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/localStorage.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ArtworksController extends GetxController {
  Future<List<Artwork>> fetchArtworks() async {
    // Replace with your logic to fetch from local storage or API
    return List<Artwork>.generate(
      10, // Update with actual artwork count
      (index) => Artwork(
        id: 'artwork-${index + 1}',
        title: 'Artwork $index',
        artist: 'Artist $index',
        description: 'Description $index',
        category: 'Category $index',
        type: 'Type $index',
        comments: [],
        imageUrl:
            'assets/images/artwork_$index.jpg', // Replace with your local paths
      ),
    );
  }
}

// liked artworks controller
class LikedArtworksController extends GetxController {
  final ArtworksController artworksController; // Inject ArtworkController
  final LocalStorageService localStorageService; // Inject local storage service
  RxSet<String> _likedArtworksIds =
      RxSet<String>(); // Initialize as empty RxSet<String>

  // getter for _likedArtworksIds
  List<String> get likedArtworksIds => _likedArtworksIds.toList();
  RxList<Artwork> likedArtworks =
      RxList<Artwork>(); // Observable list of liked artworks
  RxInt likedCount = RxInt(0);

  LikedArtworksController({
    required this.artworksController,
    required this.localStorageService,
  }) {
    _loadLikedArtworks();
  }
  Future<void> _loadLikedArtworks() async {
    List<String>? likedArtworks =
        await localStorageService.getStringList('liked_artworks');
    if (likedArtworks != null) {
      _likedArtworksIds.addAll(likedArtworks);
    }
    likedCount.value = _likedArtworksIds.length;
    // print('Liked count: ${likedCount.value}'); // Add this line

    updateLikedArtworks(); // Update the liked artworks list
  }

  void updateLikedArtworks() async {
    final artworks = await artworksController.fetchArtworks();
    // print('Fetched artworks: $artworks'); // Add this line

    likedArtworks.value = artworks
        .where((artwork) => _likedArtworksIds.contains(artwork.id))
        .toList();

    likedCount.value = _likedArtworksIds.length;
    print('Liked count: ${likedCount.value}'); // Add this line
  }

  Future<void> toggleLike(Artwork artwork) async {
    if (_likedArtworksIds.contains(artwork.id)) {
      _likedArtworksIds.remove(artwork.id);
    } else {
      _likedArtworksIds.add(artwork.id);
    }
    // print('Liked artworks IDs: $_likedArtworksIds'); // Add this line

    await localStorageService.setStringList(
        'liked_artworks', _likedArtworksIds.toList());
    updateLikedArtworks(); // Update the liked artworks list
    update();
  }

  bool isLiked(Artwork artwork) => _likedArtworksIds.contains(artwork.id);
}
