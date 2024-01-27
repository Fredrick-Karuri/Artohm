import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/art_marketplace_screen/models/art_marketplace_model.dart';
import 'package:artohmapp/presentation/art_marketplace_screen/models/marketplacechip_item_model.dart';

/// A controller class for the ArtMarketplaceScreen.
///
/// This class manages the state of the ArtMarketplaceScreen, including the
/// current artMarketplaceModelObj
class ArtMarketplaceController extends GetxController {
  Rx<ArtMarketplaceModel> artMarketplaceModelObj = ArtMarketplaceModel().obs;
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
        artMarketplaceModelObj.value.artList.value.where((art) => art.type == id).toList(),
      );
    }
  }
}
