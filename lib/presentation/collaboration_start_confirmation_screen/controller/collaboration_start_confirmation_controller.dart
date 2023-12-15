import 'package:artohmapp/core/app_export.dart';

class CollaborationStartConfirmationController extends GetxController {
  // Define your variables here. For example:
  RxString title = ''.obs;
  RxList<String> imagePaths = <String>[].obs;

  Rx <bool> isSelectedPublicSwitch = false.obs;
  Rx <bool> isSelectedPrivateSwitch = false.obs;


  // Define your methods here. For example
  void setTitle(String newTitle) {
    title.value = newTitle;
  }

  void addImagePath(String imagePath) {
    imagePaths.add(imagePath);
  }
  // Add more methods as needed...
}
