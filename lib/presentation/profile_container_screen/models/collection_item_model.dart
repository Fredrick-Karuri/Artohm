import '../../../core/app_export.dart';

/// This class is used in the [collection_item_widget] screen.
class CollectionItemModel {
  CollectionItemModel({
    this.collectionText,
    this.artworkText,
    this.id,
  }) {
    collectionText = collectionText ?? Rx("Dreamscapes");
    artworkText = artworkText ?? Rx("8 artworks");
    id = id ?? Rx("");
  }

  Rx<String>? collectionText;

  Rx<String>? artworkText;

  Rx<String>? id;
}
