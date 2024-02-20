import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';

import '../../../core/app_export.dart';

/// This class is used in the [homeartcol_item_widget] screen.
class HomeCategoriesModel {
  HomeCategoriesModel({
    this.title,
    //to delete
    this.imagePaths, 
    this.id,
  }) {
    title = title ?? Rx("AI Art: Pushing Boundaries");
    id = id ?? Rx("");
    imagePaths = imagePaths ?? Rx<List<String>>([]);
  }
  

  Rx<String>? title;

  Rx<String>? id;
  Rx<List<String>>? imagePaths;

}
//main and using this one 
class HomeCategoriesModelNew {
  final String categoryName;
  RxList<Artwork> artworks; // Make this an RxList

  HomeCategoriesModelNew({
    required this.categoryName,
    required this.artworks,
  });
}





/// This class is used in the [home_model] screen.
class HomeChipFilterModel {
  Rx<String> label;
  Rx<String> id;
  Rx<bool> isSelected;

  HomeChipFilterModel({
    String? label,
    String? id,
    bool? isSelected,
  })  : this.label = Rx<String>(label ?? ""),
        this.id = Rx<String>(id ?? ""),
        this.isSelected = Rx<bool>(isSelected ?? false);
}
