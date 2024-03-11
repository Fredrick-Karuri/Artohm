import '../../../core/app_export.dart';
import 'engagementcard_item_model.dart';

/// This class defines the variables used in the [art_community_engagement_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ArtCommunityEngagementModel {
  Rx<List<EngagementcardItemModel>> engagementcardItemList =
      Rx(List.generate(4, (index) => EngagementcardItemModel()));
}
