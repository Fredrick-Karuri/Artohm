import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/upload_artwork_two_screen/models/upload_artwork_two_model.dart';

/// A controller class for the UploadArtworkTwoScreen.
///
/// This class manages the state of the UploadArtworkTwoScreen, including the
/// current uploadArtworkTwoModelObj
class UploadArtworkTwoController extends GetxController {
  Rx<UploadArtworkTwoModel> uploadArtworkTwoModelObj =
      UploadArtworkTwoModel().obs;

  Rx<bool> isSelectedSwitch = false.obs;

  Rx<bool> isSelectedSwitch1 = false.obs;

  Rx<bool> isSelectedSwitch2 = false.obs;
}
