import '../../../core/app_export.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [art_community_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ArtCommunityModel {
  Rx<List<UserprofileItemModel>> userprofileItemList =
      Rx(List.generate(2, (index) => UserprofileItemModel()));
}
