import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
class Collection {
  final String id;
  final String name;
  final List<Artwork> artworks;

  Collection({
    required this.id,
    required this.name,
    required this.artworks,
  });

  // Convert a Collection to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'artworks': artworks.map((artwork) => artwork.toJson()).toList(),
    };
  }

  // Create a new Collection from a map
  static Collection fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'],
      name: json['name'],
      artworks: (json['artworks'] as List)
          .map((artwork) => Artwork.fromJson(artwork))
          .toList(),
    );
  }
}
