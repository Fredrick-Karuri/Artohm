
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/home_page/models/home_model.dart';
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
  @override
  void onClose() {
    super.onClose();
    inputTextController.dispose();
  }

  onSelected(dynamic value){
    for(var element in homeModelObj.value.dropdownItemList.value){
      element.isSelected=false;
      if (element.id ==value.id){
        element.isSelected=true;
      }
      homeModelObj.value.dropdownItemList.refresh();

    }
  }
}
