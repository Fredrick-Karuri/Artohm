import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String urlString) async {
  try {
    final Uri url = Uri.parse(urlString); // Parse the string into a Uri object
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch URL: $urlString'; // Simplified error handling
    }
  } catch (error) {
    // Handle errors gracefully, e.g., display an error message to the user
    print(error); // For debugging purposes
    // You can customize error handling further if needed
  }
}
