import 'package:artohmapp/core/app_export.dart';
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
  Rx<List<HomeartcolItemModel>> allItems = Rx<List<HomeartcolItemModel>>([]);

  @override
  void onInit() {
    super.onInit();

    allItems.value = List.from(homeModelObj.value.homeartcolItemList.value);
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

  onSelected(dynamic value) {
    for (var element in homeModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
      homeModelObj.value.dropdownItemList.refresh();
    }
  }

  void toggleFavorite(AnArtworkModel model) {
    model.isFavorited.toggle();
  }

  void toggleChipSelection(String id) {
    for (var item in homeChipFilterList.value) {
      if (item.id.value == id) {
        item.isSelected.value = true;
      } else {
        item.isSelected.value = false;
      }
    }
    filterItems();
    update();
  }

  void filterItems() {
    List<HomeartcolItemModel> filteredList = [];
    List<HomeChipFilterModel> selectedChips = this.selectedChips;

    for (var item in homeModelObj.value.homeartcolItemList.value) {
      for (var chip in selectedChips) {
        if (item.id!.value == chip.id.value) {
          filteredList.add(item);
          break;
        }
      }
    }
    homeModelObj.value.homeartcolItemList.value = filteredList;
    update();
  }

  void clearFilter() {
    for (var item in homeChipFilterList.value) {
      item.isSelected.value = false;
    }
    // Restore all items when the filter is cleared
    homeModelObj.value.homeartcolItemList.value = List.from(allItems.value);

    // filterItems();
    update();
  }

  List<HomeChipFilterModel> get selectedChips {
    return homeChipFilterList.value
        .where((chip) => chip.isSelected.value)
        .toList();
  }
}
