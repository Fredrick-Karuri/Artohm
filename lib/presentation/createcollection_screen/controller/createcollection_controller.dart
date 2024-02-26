import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/localStorage.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:artohmapp/presentation/createcollection_screen/models/createcollection_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the CreatecollectionScreen.
///
/// This class manages the state of the CreatecollectionScreen, including the
/// current CollectionFormModelObj
enum VisibilitySetting { Private, FollowersOnly, Public }

class CollectionFormController extends GetxController {
  final LocalStorageService localStorageService; // Inject local storage service

  CollectionFormController(this.localStorageService);

  var selectedArtworks = <String>[].obs;

  void toggleArtworkSelection(String artworkId) {
    if (selectedArtworks.contains(artworkId)) {
      selectedArtworks.remove(artworkId);
    } else {
      selectedArtworks.add(artworkId);
    }
  }

  TextEditingController nameController = TextEditingController();
  Rx<CollectionFormModel> collectionFormModelObj = CollectionFormModel().obs;

  TextEditingController descriptionController = TextEditingController();
  Rx<VisibilitySetting> currentSetting = VisibilitySetting.Private.obs;
  FocusNode nameFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    descriptionController.dispose();
    nameFocusNode.dispose();
    descriptionFocusNode.dispose();
    loadSwitchState();
  }

  void loadSwitchState() async {
    String? setting = await localStorageService.getString("currentSetting");
    switch (setting) {
      case "FollowersOnly":
        currentSetting.value = VisibilitySetting.FollowersOnly;
        break;
      case "Public":
        currentSetting.value = VisibilitySetting.Public;
        break;
      default:
        currentSetting.value = VisibilitySetting.Private;
        break;
    }
  }

  void saveSwitchState(String setting) async {
    await LocalStorageService().setString("currentSetting", setting);
  }

  void updateSwitchState(VisibilitySetting setting) {
    currentSetting.value = setting;
    saveSwitchState(setting.toString().split('.').last);
  }
}

class ArtworkFilterController extends GetxController {
  var showFavoritesOnly = false.obs;
}
