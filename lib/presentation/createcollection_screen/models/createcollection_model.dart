import '../../../core/app_export.dart';
import 'selectartwork_item_model.dart';

/// This class defines the variables used in the [createcollection_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CollectionFormModel {
  Rx<List<SelectartworkItemModel>> selectartworkItemList =
      Rx(List.generate(4, (index) => SelectartworkItemModel()));
}
