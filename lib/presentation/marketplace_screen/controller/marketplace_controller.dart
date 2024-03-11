import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/marketplace_screen/models/marketplace_model.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';

/// A controller class for the MarketplaceScreen.
///
/// This class manages the state of the MarketplaceScreen, including the
/// current artMarketplaceModelObj
class MarketplaceController extends GetxController {
  Rx<MarketplaceModel> artMarketplaceModelObj = MarketplaceModel().obs;
  RxList<MarketPlaceArtwork> filteredArtworks = RxList<MarketPlaceArtwork>();

  @override
  void onInit() {
    super.onInit();
    // Initialize filteredArtworks with all artworks
    filteredArtworks.addAll(artMarketplaceModelObj.value.artList.value);
  }

  void filterArt(String id) {
    if (id == "all") {
      // If "all" is selected, show all artworks
      filteredArtworks.assignAll(artMarketplaceModelObj.value.artList.value);
    } else {
      // Filter the artworks based on the selected chip id
      filteredArtworks.assignAll(
        artMarketplaceModelObj.value.artList.value
            .where((art) => art.type == id)
            .toList(),
      );
    }
  }
}

class ArtworkForSaleController extends GetxController {
  var artworksForSale = <Artwork>[].obs;
  var categories = <String>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchArtworksForSale();
    fetchCategories();
  }

  Future<void> fetchArtworksForSale() async {
    artworksForSale.assignAll(
      artworks.where((artwork) => artwork.forSale).toList(),
    );
  }

  Future<void> fetchCategories() async {
    categories.assignAll(
      artworks.map((artwork) => artwork.category).toSet().toList(),
    );
  }

  List<Artwork> getArtworksByCategory(String category) {
    return artworksForSale
        .where((artwork) => artwork.category == category)
        .toList();
  }

  String formatCategory(String category) {
    return category
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}

class FeaturedArtworksController extends GetxController {
  var featuredArtworks = <Artwork>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchFeaturedArtworks();
  }

  Future<void> fetchFeaturedArtworks() async {
    // featuredArtworks.assignAll(
    //   artworks.where((artwork) => artwork.isFeatured).toList(),
    // );
    featuredArtworks.assignAll(
        artworks.where((artwork) => artwork.forSale).take(5).toList());
  }
}
