import 'package:artohmapp/core/app_export.dart';

class ApiClient extends GetConnect {
  // Define the base URL in the constructor
  ApiClient() {
    httpClient.baseUrl = 'https://your-backend-server.com';
  }

  // User registration method
  Future<Response> registerUser(
      String fullName, String email, String password) {
    return post(
      '/signup',
      {
        'fullName': fullName,
        'email': email,
        'password': password,
      },
    );
  }

  Future<Response> loginUser(String email, String password) {
    return post(
      '/login',
      {
        'email': email,
        'password': password,
      },
    );
  }
}
