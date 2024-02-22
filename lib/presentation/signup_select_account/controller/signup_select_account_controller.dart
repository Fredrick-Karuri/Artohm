import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/localStorage.dart';
import 'package:flutter/material.dart';

enum AccountType { artist, enthusiast, none }

final localStorageService = Get.find<LocalStorageService>();

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

  void saveDetails(String style) {
    portfolioLink.value = portfolioLinkController.text;
    bio.value = bioController.text;
    artStyle.value = style;

    // Save the details to local storage
    localStorageService.setStringList('portfolioLink', [portfolioLink.value]);
    localStorageService.setStringList('bio', [bio.value]);
    localStorageService.setStringList('artStyle', [artStyle.value]);
  }

  TextEditingController portfolioLinkController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  FocusNode portfolioLinkFocusNode = FocusNode();
  FocusNode bioFocusNode = FocusNode();
  @override
  void onClose() {
    super.onClose();
    portfolioLinkFocusNode.dispose();
    bioFocusNode.dispose();
    portfolioLinkController.dispose();
    bioController.dispose();
  }
}

class ArtEnthusiastDetailsController extends GetxController {
  var favoriteStyles = <String>[].obs;
  var wantsNotifications = false.obs;

  void saveDetails(List<String> styles, bool notifications) {
    favoriteStyles.value = styles;
    wantsNotifications.value = notifications;
  }
}
