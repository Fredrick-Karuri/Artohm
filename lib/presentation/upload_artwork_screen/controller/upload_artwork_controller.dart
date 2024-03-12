import 'dart:convert';

import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/localStorage.dart';
import 'package:artohmapp/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:artohmapp/presentation/artworks/widgets/tools(mediums).dart';
import 'package:artohmapp/presentation/upload_artwork_screen/models/upload_artwork_model.dart';
import 'package:artohmapp/presentation/upload_artwork_screen/widgets/artwork_tags.dart';
import 'package:artohmapp/presentation/upload_artwork_screen/widgets/artwork_type.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// A controller class for the UploadArtworkScreen.
///
/// This class manages the state of the UploadArtworkScreen, including the
/// current uploadArtworkModelObj

class UploadArtworkController extends GetxController {
  LocalStorageService localStorageService = LocalStorageService();
  Rx<UploadArtworkModel> uploadArtworkModelObj = UploadArtworkModel().obs;
  SelectionPopupModel? selectedDropDownValue;
  SelectionPopupModel? selectedDropDownValue1;
  final ImagePicker _picker = ImagePicker();

  TextEditingController inputTitleController = TextEditingController();
  TextEditingController inputDescriptionController = TextEditingController();

  TextEditingController inputWidthController = TextEditingController();
  TextEditingController inputHeightController = TextEditingController();

  FocusNode inputTitleFocusNode = FocusNode();
  FocusNode inputDescriptionFocusNode = FocusNode();
  FocusNode inputWidthFocusNode = FocusNode();
  FocusNode inputHeightFocusNode = FocusNode();

  //  ArtworkTypeController artworkTypeController = Get.find();

  @override
  void onInit() {
    super.onInit();
    // ever(artworkTypeController.selectedArtworkType, (_) => saveArtworkDetails());
  }

  @override
  void onClose() {
    super.onClose();
    inputTitleController.dispose();
    inputDescriptionController.dispose();
    inputTitleFocusNode.dispose();
    inputDescriptionFocusNode.dispose();
    inputWidthController.dispose();
    inputHeightController.dispose();
    inputWidthFocusNode.dispose();
    inputHeightFocusNode.dispose();
  }

  onSelectedDimensions(int value) {
    for (var element
        in uploadArtworkModelObj.value.dimensionsDropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value) {
        // Now we're comparing two integers
        element.isSelected = true;
      }
    }
    uploadArtworkModelObj.value.dimensionsDropdownItemList.refresh();
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // handle picked image
      print('image path:${image.path}');
      await localStorageService.setString('image', image.path);
    } else {
      print('no image selected');
    }
  }

  Future<void> takePicture() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print('image path:${image.path}');
      await localStorageService.setString('image', image.path);
    } else {
      print('no image selected');
    }
  }

  var yourWorks = <Artwork>[].obs;

  void saveArtworkDetails() async {
    try {
      // Gather all the necessary details
      String title = inputTitleController.text;
      String description = inputDescriptionController.text;
      String width = inputWidthController.text;
      String height = inputHeightController.text;
      String? imagePath = await localStorageService.getString('image');
      String artworkType =
          Get.find<ArtworkTypeController>().selectedArtworkType.value;
      List<String> tags =
          Get.find<ArtworkTagController>().selectedTags.toList();
      print('Tags: $tags'); // Print the tags
      List<String> mediums =
          Get.find<MediumsController>().selectedMediums.toList();
      ArtworkSaleController saleController = Get.find<ArtworkSaleController>();

      // Save these details
      await localStorageService.setString('title', title);
      await localStorageService.setString('description', description);
      await localStorageService.setString('width', width);
      await localStorageService.setString('height', height);
      await localStorageService.setString('artworkType', artworkType);
      await localStorageService.setStringList('tags', tags);
      await localStorageService.setStringList('mediums', mediums);
      await localStorageService.setDouble('price', saleController.price.value);
      await localStorageService.setBool(
          'forSale', saleController.isForSale.value);

      if (imagePath != null) {
        await localStorageService.setString('image', imagePath);
      }
    } catch (e) {
      print('Error saving artwork details: $e');
    }
  }

  Future<Artwork> createArtwork() async {
    // Gather all the necessary details
    String title = inputTitleController.text;
    String description = inputDescriptionController.text;
    double width = double.tryParse(inputWidthController.text) ??
        0.0; // Provide a default value
    double height = double.tryParse(inputHeightController.text) ??
        0.0; // Provide a default value
    String? imagePath = await localStorageService.getString('image');
    String artworkType = Get.find<ArtworkTypeController>()
        .selectedArtworkType
        .value; // Get the selected artwork type
    List<String> tags = Get.find<ArtworkTagController>()
        .selectedTags
        .toList(); // Get the selected tags
    ArtworkSaleController saleController = Get.find<ArtworkSaleController>();

    // Create a new Artwork object
    Artwork newArtwork = Artwork(
      title: title,
      artist: "Your Artist Name", // Replace with the actual artist name
      imageUrl: imagePath ?? '',
      id: uuid.v4(), // Replace with a unique ID for the artwork
      type: artworkType,
      category: "Your Artwork Category", // Replace with the actual category
      description: description,
      likes: 0,
      comments: [], // Initialize with an empty list
      // price: double.tryParse(
      //     inputWidthController.text), // Replace with the actual price

      tools: [], // Replace with the actual tools
      tags: tags,
      forSale: saleController.isForSale.value,
      price: saleController.price.value,
      // currency: saleController.currency.value,

      dimensions: Dimension.fromJson({
        'width': double.tryParse(inputWidthController.text),
        'height': double.tryParse(inputHeightController.text),
      }), // Replace with the actual dimensions
    );

    return newArtwork;
  }

Future<Artwork?> getArtworkById(String id) async {
  String? artworkJson = await localStorageService.getString('artwork_$id');

  if (artworkJson != null) {
    Map<String, dynamic> artworkMap = jsonDecode(artworkJson);
    return Artwork.fromJson(artworkMap);
  } else {
    print('Artwork not found');
    return null;
  }
}

void editArtwork(String id, Map<String, dynamic> newDetails) async {
  Artwork? artwork = await getArtworkById(id);

  if (artwork != null) {
    // Update the artwork details with the new details
    artwork.title = newDetails['title'] ?? artwork.title;
    artwork.imageUrl = newDetails['imageUrl'] ?? artwork.imageUrl;
    artwork.type = newDetails['type'] ?? artwork.type;
    artwork.category = newDetails['category'] ?? artwork.category;
    artwork.description = newDetails['description'] ?? artwork.description;
    artwork.likes = newDetails['likes'] ?? artwork.likes;
    artwork.comments = newDetails['comments'] ?? artwork.comments;
    artwork.price = newDetails['price'] ?? artwork.price;
    artwork.forSale = newDetails['forSale'] ?? artwork.forSale;
    artwork.tools = newDetails['tools'] ?? artwork.tools;
    artwork.tags = newDetails['tags'] ?? artwork.tags;
    artwork.dimensions = newDetails['dimensions'] ?? artwork.dimensions;

    // Save the updated artwork details to local storage
    saveArtworkDetails();
  }
}


  void postArtwork() async {
    Artwork newArtwork = await createArtwork();
    yourWorks.add(newArtwork);
    resetArtworkDetails();
  }

  void resetArtworkDetails() {
    inputTitleController.clear();
    inputDescriptionController.clear();
    inputWidthController.clear();
    inputHeightController.clear();
    Get.find<ArtworkTypeController>().selectedArtworkType.value = '';
    Get.find<ArtworkTagController>().selectedTags.clear();
    Get.find<MediumsController>().selectedMediums.clear();
    Get.find<ArtworkSaleController>().isForSale.value = false;
    Get.find<ArtworkSaleController>().price.value = 0.0;
    localStorageService.setString('image', ''); // Clear the image path
  }

  onSelectedMedium(int value) {
    for (var element
        in uploadArtworkModelObj.value.mediumDropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value) {
        // Now we're comparing two integers
        element.isSelected = true;
      }
    }
    uploadArtworkModelObj.value.mediumDropdownItemList.refresh();
  }
}

// class ArtworkTagController extends GetxController {
//   TextEditingController inputTagController = TextEditingController();
//   FocusNode inputTagFocusNode = FocusNode();

//   void onClose() {
//     super.onClose();
//     inputTagController.dispose();
//     inputTagFocusNode.dispose();
//   }

//   void addTag() {
//     if (inputTagController.text.isNotEmpty) {
//       selectedTags.add(inputTagController.text);
//       inputTagController.clear();
//     }
//   }

//   var selectedTags = <String>[].obs;
// }

class ArtworkSaleController extends GetxController {
  LocalStorageService localStorageService = LocalStorageService();

  var isForSale = false.obs;
  var price = 0.0.obs;
  var currency = ''.obs;
  TextEditingController priceController = TextEditingController();
  FocusNode priceFocusNode = FocusNode();
  List<String> currencies = ['KSH', 'USD'].obs;

  void onClose() {
    super.onClose();
    priceController.dispose();
    priceFocusNode.dispose();
  }

  void updateSaleInfo(bool forSale, String? newPrice, String? newCurrency) {
    isForSale.value = forSale;
    price.value = double.tryParse(newPrice ?? '') ?? 0.0;
    currency.value = newCurrency ?? '';
    localStorageService.setDouble('price', price.value);
    localStorageService.setBool('forSale', isForSale.value);
    localStorageService.setString('currency', currency.value);
  }
}



  // String artworkType = artworksTypeController.selectedArtworkType.value;
  // List <String> tags = artworkTagController.selectedTags;
  // List <String> mediums =mediumsController.selectedMediums;

  //   await localStorageService.setString('artworkType', artworkType);
  // await localStorageService.setStringList('tags', tags);
  // await localStorageService.setStringList('mediums',mediums);