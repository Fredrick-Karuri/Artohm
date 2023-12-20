import 'package:artohmapp/core/app_export.dart';

class ApiClient extends GetConnect {
  // Define the base URL in the constructor
  ApiClient() {
    httpClient.baseUrl = 'http://192.168.100.8:8000/';
  }

  // User registration method
  Future<Response> registerUser(
      String fullName, String email, String password) {
    return post(
      '/users/register/',
      {
        'username': fullName,
        'email': email,
        'password': password,
      },
    );
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
