import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/modal_screen/models/modal_model.dart';

/// A controller class for the ModalScreen.
///
/// This class manages the state of the ModalScreen, including the
/// current modalModelObj
class ModalController extends GetxController {
  Rx<ModalModel> modalModelObj = ModalModel().obs;
}
