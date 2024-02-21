import 'package:artohmapp/core/app_export.dart';

enum AccountType { artist, enthusiast, none }

class AccountTypeController extends GetxController {
  var selectedType = AccountType.none.obs;

  void selectType(AccountType type) {
    selectedType.value = type;
  }
}

class ArtistTrackController extends GetxController {
  var portfolioLink = ''.obs;
  var bio = ''.obs;
  var artStyle = ''.obs;

  void saveDetails(String portfolio, String biography, String style) {
    portfolioLink.value = portfolio;
    bio.value = biography;
    artStyle.value = style;
  }
}