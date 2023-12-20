import '../../../core/app_export.dart';
import 'artwork_visibilty_model.dart';
import 'comment_visibilty_model.dart';

/// This class defines the variables used in the [privacy_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PrivacyModel {
  Rx<List<ArtworkVisibilityModel>> artworkVisibilityList = Rx(
    ["Everyone", "Followers Only", "Private"].map((option) {
      return ArtworkVisibilityModel()..select.value = option;
    }).toList(),
  );


  Rx<List<CommentVisibilityModel>> commentVisibilityList = Rx(
    ["Everyone", "Followers Only", "Private"].map((option) {
      return CommentVisibilityModel()..select.value = option;
    }).toList(),
  );


}
