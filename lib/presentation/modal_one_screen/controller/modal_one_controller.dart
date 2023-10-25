import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/modal_one_screen/models/modal_one_model.dart';

/// A controller class for the ModalOneScreen.
///
/// This class manages the state of the ModalOneScreen, including the
/// current modalOneModelObj
class ModalOneController extends GetxController {
  Rx<ModalOneModel> modalOneModelObj = ModalOneModel().obs;
}
