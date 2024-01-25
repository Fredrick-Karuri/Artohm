import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/art_marketplace_screen/models/art_marketplace_model.dart';
import 'package:artohmapp/presentation/art_marketplace_screen/models/marketplacechip_item_model.dart';

/// A controller class for the ArtMarketplaceScreen.
///
/// This class manages the state of the ArtMarketplaceScreen, including the
/// current artMarketplaceModelObj
class ArtMarketplaceController extends GetxController {
  Rx<ArtMarketplaceModel> artMarketplaceModelObj = ArtMarketplaceModel().obs;
  // In ArtMarketplaceController
  RxList<MarketPlaceArtwork> filteredArtworks = RxList<MarketPlaceArtwork>();

  // list of filtered items
  RxList<MarketplaceChipItemModel> filteredItems =
      RxList<MarketplaceChipItemModel>();
  RxString selectedChipId = RxString("");

  void filterArt(String id) {
    selectedChipId.value = id;

    // Filter the artworks based on the selected chip id
    filteredArtworks.value = artMarketplaceModelObj.value.artList.value
        .where((art) => art.type == id)
        .toList();
  }
}
