import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/modal_screen/models/modal_model.dart';

/// A controller class for the ModalScreen.
///
/// This class manages the state of the ModalScreen, including the
/// current modalModelObj
class ModalController extends GetxController {
  Rx<ModalModel> modalModelObj = ModalModel(
          title: 'Art Unveiling : Exploring dimensions',
          date: 'Saturday, 12th June 2021',
          location: 'The Art House, Bengaluru',
          buttonText: 'Book Ticket',
          description: 'Join me in the unveiling of my latest artwork, '
              'where I explore the dimensions of the human mind. ')
      .obs;
}
