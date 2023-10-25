import '../../../core/app_export.dart';
import 'marketplacechip_item_model.dart';

/// This class defines the variables used in the [art_marketplace_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ArtMarketplaceModel {
  Rx<List<MarketplacechipItemModel>> marketplacechipItemList =
      Rx(List.generate(4, (index) => MarketplacechipItemModel()));
}
