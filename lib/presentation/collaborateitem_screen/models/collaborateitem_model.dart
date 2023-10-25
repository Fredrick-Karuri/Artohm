import '../../../core/app_export.dart';
import 'chipviewcont_item_model.dart';
import 'chipviewcont2_item_model.dart';

/// This class defines the variables used in the [collaborateitem_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CollaborateitemModel {
  Rx<List<ChipviewcontItemModel>> chipviewcontItemList =
      Rx(List.generate(2, (index) => ChipviewcontItemModel()));

  Rx<List<Chipviewcont2ItemModel>> chipviewcont2ItemList =
      Rx(List.generate(2, (index) => Chipviewcont2ItemModel()));
}
