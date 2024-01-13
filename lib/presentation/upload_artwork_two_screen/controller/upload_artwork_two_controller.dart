import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/upload_artwork_two_screen/models/upload_artwork_two_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


/// A controller class for the UploadArtworkTwoScreen.
///
/// This class manages the state of the UploadArtworkTwoScreen, including the
/// current uploadArtworkTwoModelObj
class UploadArtworkTwoController extends GetxController {
  Rx<UploadArtworkTwoModel> uploadArtworkTwoModelObj =
      UploadArtworkTwoModel().obs;
  
  RxInt selectedSwitch = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadSelectedSwitch();
  }

  void updateSelectedSwitch( int switchNumber) async {
    selectedSwitch.value = switchNumber;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedSwitch', switchNumber);

  }
  bool isSelectedSwitch(int switchNumber) {
    return selectedSwitch.value == switchNumber;
  }
  void loadSelectedSwitch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedSwitch.value = prefs.getInt('selectedSwitch') ?? 0;
    
    }
  }

  // Rx<bool> isSelectedSwitch = false.obs;

  // Rx<bool> isSelectedSwitch1 = false.obs;

  // Rx<bool> isSelectedSwitch2 = false.obs;

