import 'package:artohmapp/presentation/home_page/models/home_model.dart';

import '../../../core/app_export.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel {
  Rx<List<HomeartcolItemModel>> homeartcolItemList = Rx(
    [
      HomeartcolItemModel(
        id: Rx('art'),
        aiArtPushingTex: Rx('Hybrid Art: Bridging Realities'),
        imagePaths: Rx(
          [
            ImageConstant.imgRectangle11200x1601,
            ImageConstant.imgRectangle11200x1601,
            ImageConstant.imgRectangle11200x1601,
          ],
        ),
      ),
      HomeartcolItemModel(
        id: Rx('art'),
        aiArtPushingTex: Rx('Traditional Art: Timeless Craftsmanship '),
        imagePaths: Rx(
          [
            ImageConstant.imgRectangle11200x1602,
            ImageConstant.imgRectangle11200x1602,
            ImageConstant.imgRectangle11200x1602,
          ],
        ),
      ),
      HomeartcolItemModel(
        id: Rx('ptg'),
        aiArtPushingTex: Rx('From Artists you follow '),
        imagePaths: Rx(
          [
            ImageConstant.imgRectangle11200x1603,
            ImageConstant.imgRectangle11200x1603,
            ImageConstant.imgRectangle11200x1603,
          ],
        ),
      ),
      HomeartcolItemModel(
        id: Rx('pho'),
        aiArtPushingTex: Rx('Abstract art '),
        imagePaths: Rx(
          [
            ImageConstant.imgRectangle11200x1604,
            ImageConstant.imgRectangle11200x1604,
            ImageConstant.imgRectangle11200x1604,
          ],
        ),
      ),
      HomeartcolItemModel(
        id: Rx('pho'),
        aiArtPushingTex: Rx('African art '),
        imagePaths: Rx(
          [
            ImageConstant.imgRectangle11200x1605,
            ImageConstant.imgRectangle11200x1605,
            ImageConstant.imgRectangle11200x1605,
          ],
        ),
      ),
      HomeartcolItemModel(
        id: Rx('art'),
        aiArtPushingTex: Rx('Pop art'),
        imagePaths: Rx(
          [
            ImageConstant.imgRectangle11200x1606,
            ImageConstant.imgRectangle11200x1606,
            ImageConstant.imgRectangle11200x1606,
          ],
        ),
      ),
    ],
  );
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx(
    [
      SelectionPopupModel(
        id: 1,
        title: "Genre",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Theme",
      ),
      SelectionPopupModel(
        id: 3,
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
