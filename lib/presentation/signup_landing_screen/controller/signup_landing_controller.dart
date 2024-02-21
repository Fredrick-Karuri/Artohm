import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/signup_landing_screen/models/signup_landing_model.dart';

/// A controller class for the SignupScreen.
///
/// This class manages the state of the SignupScreen, including the
/// current SignupLandingModelObj
class SignupLandingController extends GetxController {
  Rx<SignupLandingModel> signupLandingModelObj = SignupLandingModel().obs;
}
