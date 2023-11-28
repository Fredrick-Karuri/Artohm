import '../../../core/app_export.dart';
import 'row_item_model.dart';
import 'row2_item_model.dart';

/// This class defines the variables used in the [privacy_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PrivacyModel {
  Rx<List<RowItemModel>> rowItemList = Rx(
    List.generate(
      2,
      (index) => RowItemModel(),
    ),
  );

  Rx<List<Row2ItemModel>> row2ItemList = Rx(
    List.generate(
      2,
      (index) => Row2ItemModel(),
    ),
  );
}
