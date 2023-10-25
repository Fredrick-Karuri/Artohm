import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/collaborateitem_screen/models/collaborateitem_model.dart';

/// A controller class for the CollaborateitemScreen.
///
/// This class manages the state of the CollaborateitemScreen, including the
/// current collaborateitemModelObj
class CollaborateitemController extends GetxController {
  Rx<CollaborateitemModel> collaborateitemModelObj = CollaborateitemModel().obs;
}
