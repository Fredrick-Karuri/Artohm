import 'package:artohmapp/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:artohmapp/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:artohmapp/presentation/home_page/models/home_model.dart';

import '../../../core/app_export.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel {
  // Rx<List<HomeCategoriesModel>> homeCategoriesList = Rx(
  //   [
  //     HomeCategoriesModel(
  //       id: Rx('art'),
  //       title: Rx('Hybrid Art: Bridging Realities'),
  //       imagePaths: Rx(
  //         [
  //           ImageConstant.imgRectangle11200x1601,
  //           ImageConstant.imgRectangle11200x1601,
  //           ImageConstant.imgRectangle11200x1601,
  //         ],
  //       ),
  //     ),
  //     HomeCategoriesModel(
  //       id: Rx('art'),
  //       title: Rx('Traditional Art: Timeless Craftsmanship '),
  //       imagePaths: Rx(
  //         [
  //           ImageConstant.imgRectangle11200x1602,
  //           ImageConstant.imgRectangle11200x1602,
  //           ImageConstant.imgRectangle11200x1602,
  //         ],
  //       ),
  //     ),
  //     HomeCategoriesModel(
  //       id: Rx('ptg'),
  //       title: Rx('From Artists you follow '),
  //       imagePaths: Rx(
  //         [
  //           ImageConstant.imgRectangle11200x1603,
  //           ImageConstant.imgRectangle11200x1603,
  //           ImageConstant.imgRectangle11200x1603,
  //         ],
  //       ),
  //     ),
  //     HomeCategoriesModel(
  //       id: Rx('pho'),
  //       title: Rx('Abstract art '),
  //       imagePaths: Rx(
  //         [
  //           ImageConstant.imgRectangle11200x1604,
  //           ImageConstant.imgRectangle11200x1604,
  //           ImageConstant.imgRectangle11200x1604,
  //         ],
  //       ),
  //     ),
  //     HomeCategoriesModel(
  //       id: Rx('pho'),
  //       title: Rx('African art '),
  //       imagePaths: Rx(
  //         [
  //           ImageConstant.imgRectangle11200x1605,
  //           ImageConstant.imgRectangle11200x1605,
  //           ImageConstant.imgRectangle11200x1605,
  //         ],
  //       ),
  //     ),
  //     HomeCategoriesModel(
  //       id: Rx('art'),
  //       title: Rx('Pop art'),
  //       imagePaths: Rx(
  //         [
  //           ImageConstant.imgRectangle11200x1606,
  //           ImageConstant.imgRectangle11200x1606,
  //           ImageConstant.imgRectangle11200x1606,
  //         ],
  //       ),
  //     ),
  //   ],
  // );
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx(
    [
      SelectionPopupModel(
        title: "Genre",
        isSelected: true,
      ),
      SelectionPopupModel(
        title: "Theme",
      ),
      SelectionPopupModel(
        title: "Art Style",
      )
    ],
  );
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
}

class AnArtworkModel {
  RxBool isFavorited = false.obs;
}
