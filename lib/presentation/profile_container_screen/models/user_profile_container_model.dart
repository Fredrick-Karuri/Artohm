import '../../../core/app_export.dart';
import 'enchantedforest_item_model.dart';
import 'collection_item_model.dart';

/// This class defines the variables used in the [user_profile_container_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class UserProfileContainerModel {
  Rx<List<EnchantedforestItemModel>> enchantedforestItemList =
      Rx(List.generate(5, (index) => EnchantedforestItemModel()));

  Rx<List<CollectionItemModel>> collectionItemList =
      Rx(List.generate(3, (index) => CollectionItemModel()));
}
