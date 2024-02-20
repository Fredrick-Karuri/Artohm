import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:artohmapp/presentation/home_page/models/home_model.dart';
import 'package:artohmapp/presentation/home_page/models/home_model_populated.dart';
import 'package:flutter/material.dart';

/// A controller class for the HomePage.
///
/// This class manages the state of the HomePage, including the
/// current homeModelObj
class HomeController extends GetxController {
  TextEditingController inputTextController = TextEditingController();
  HomeController(this.homeModelObj);

  Rx<HomeModel> homeModelObj;
  SelectionPopupModel? selectedDropDownValue;
  Rx<List<HomeCategoriesModel>> allItems = Rx<List<HomeCategoriesModel>>([]);

  Rx<List<HomeCategoriesModelNew>> categories =
      Rx<List<HomeCategoriesModelNew>>([]);

  RxList<Artwork> originalArtworks = <Artwork>[].obs; // Add this line

  @override
  void onInit() {
    super.onInit();

    // allItems.value = List.from(homeModelObj.value.homeCategoriesList.value);
    _loadCategories();
  }

  void _loadCategories() {
  originalArtworks.addAll(artworks); // Add this line

  var allCategories = [
    HomeCategoriesModelNew(
      categoryName: "African Art",
      artworks: RxList<Artwork>(artworks
          .where((artwork) => artwork.category == "african_art")
          .toList()),
    ),
    HomeCategoriesModelNew(
      categoryName: "Abstract Art",
      artworks: RxList<Artwork>(artworks
          .where((artwork) => artwork.category == "abstract_art")
          .toList()),
    ),
    HomeCategoriesModelNew(
      categoryName: "Pop Art",
      artworks: RxList<Artwork>(artworks
          .where((artwork) => artwork.category == "pop_art")
          .toList()),
    ),
    HomeCategoriesModelNew(
      categoryName: "Photography",
      artworks: RxList<Artwork>(artworks
          .where((artwork) => artwork.category == "photography")
          .toList()),
    )
  ];

  // Only include categories that have at least one artwork
  categories.value = allCategories.where((category) => category.artworks.isNotEmpty).toList();
}


  Rx<List<HomeChipFilterModel>> homeChipFilterList = Rx(
    [
      HomeChipFilterModel(
        label: 'Art',
        id: 'art',
        isSelected: false,
      ),
      HomeChipFilterModel(
        label: 'Photography',
        id: 'pho',
        isSelected: false,
      ),
      HomeChipFilterModel(
        label: 'Painting',
        id: 'ptg',
        isSelected: false,
      )
    ],
  );

  @override
  void onClose() {
    super.onClose();
    inputTextController.dispose();
  }

  void toggleChipSelection(String id) {
    for (var item in homeChipFilterList.value) {
      if (item.id.value == id) {
        item.isSelected.value = !item.isSelected.value; // Toggle the selection
      } else {
        item.isSelected.value = false; // Deselect all other chips
      }
    }
    filterArtworks();
    update();
  }

  // new fitering
  void filterArtworks() {
    List<HomeChipFilterModel> selectedChips = this.selectedChips;

    if (selectedChips.isEmpty) {
      // If no chip is selected, restore all artworks
      for (var category in categories.value) {
        category.artworks.value = originalArtworks
            .where((artwork) =>
                artwork.category ==
                category.categoryName.toLowerCase().replaceAll(' ', '_'))
            .toList();
      }
    } else {
      // If a chip is selected, filter the artworks
      for (var category in categories.value) {
        category.artworks.value = originalArtworks.where((artwork) {
          return artwork.category ==
                  category.categoryName.toLowerCase().replaceAll(' ', '_') &&
              selectedChips.any((chip) => chip.id.value == artwork.type);
        }).toList();
      }
    }

    print('Categories after filtering: ${categories.value}'); // Add this line

    update();
  }

  List<HomeChipFilterModel> get selectedChips {
    return homeChipFilterList.value
        .where((chip) => chip.isSelected.value)
        .toList();
  }
}

  // void toggleFavorite(AnArtworkModel model) {
  //   model.isFavorited.toggle();
  // }

  // void filterItems() {
  //   List<HomeCategoriesModel> filteredList = [];
  //   List<HomeChipFilterModel> selectedChips = this.selectedChips;

  //   for (var item in homeModelObj.value.homeCategoriesList.value) {
  //     for (var chip in selectedChips) {
  //       if (item.id!.value == chip.id.value) {
  //         filteredList.add(item);
  //         break;
  //       }
  //     }
  //   }
  //   homeModelObj.value.homeCategoriesList.value = filteredList;
  //   update();
  // }


  // onSelected(dynamic value) {
  //   for (var element in homeModelObj.value.dropdownItemList.value) {
  //     element.isSelected = false;
  //     if (element.id == value.id) {
  //       element.isSelected = true;
  //     }
  //     homeModelObj.value.dropdownItemList.refresh();
  //   }
  // }
  