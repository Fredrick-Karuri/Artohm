import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/signup_select_account/controller/signup_select_account_controller.dart';

class ApiClient extends GetConnect {
  // Define the base URL in the constructor
  ApiClient() {
    httpClient.baseUrl = 'http://192.168.100.8:8000/';
  }

  // User registration method
  Future<Response> registerUser(
      String fullName, String email, String password) {
    final accountTypeController = Get.find<AccountTypeController>();
    final selectedAccountType =
        accountTypeController.selectedType.value.toString();

    if (selectedAccountType == "artist") {
      return post(
        '/users/register/',
        {
          'username': fullName,
          'email': email,
          'password': password,
          'accountType': "artist"
        },
      );
    } else {
      return post(
        '/users/register/',
        {
          'username': fullName,
          'email': email,
          'password': password,
          'accountType': "normal"
        },
      );
    }
  }

  Future<Response> loginUser(String email, String password) {
    return post(
      '/users/login',
      {
        'email': email,
        'password': password,
      },
    );
  }
}
