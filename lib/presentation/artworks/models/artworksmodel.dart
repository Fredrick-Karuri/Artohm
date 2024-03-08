import 'package:artohmapp/core/app_export.dart';
import 'package:uuid/uuid.dart';

class Artwork {
  final String title;
  final String artist;
  final String imageUrl;
  final String id;
  final String type;
  final String category;
  final String description;
  RxBool isFavorite = false.obs;
  int likes;
  List<Comment> comments;
  final double? price;
  final bool forSale;
  final List<String>? tools;
  final List<String>? tags;
  final Dimension? dimensions;

  Artwork({
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.id,
    required this.type,
    required this.category,
    required this.description,
    this.likes = 0,
    required this.comments,
    this.price,
    this.forSale = false,
    this.tools,
    this.tags,
    this.dimensions,
  });

  // Convert an Artwork to a Map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'artist': artist,
      'imageUrl': imageUrl,
      'id': id,
      'type': type,
      'category': category,
      'description': description,
      'likes': likes,
      'comments': comments.map((comment) => comment.toJson()).toList(),
      'price': price,
      'forSale': forSale,
      'tools': tools,
      'tags': tags,
      'dimensions': dimensions?.toJson(),
    };
  }

  // Create a new Artwork from a map
  static Artwork fromJson(Map<String, dynamic> json) {
    return Artwork(
      title: json['title'],
      artist: json['artist'],
      imageUrl: json['imageUrl'],
      id: json['id'],
      type: json['type'],
      category: json['category'],
      description: json['description'],
      likes: json['likes'],
      comments: (json['comments'] as List)
          .map((comment) => Comment.fromJson(comment))
          .toList(),
      price: json['price'],
      forSale: json['forSale'],
      tools: json['tools'] != null ? List<String>.from(json['tools']) : null,
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      dimensions: json['dimensions'] != null
          ? Dimension.fromJson(json['dimensions'])
          : null,
    );
  }
}

var uuid = Uuid();
List<Artwork> artworks = [
  Artwork(
    title: 'Ethereal Enchantment',
    artist: 'Sophia Anderson',
    imageUrl: ImageConstant.imgRectangle11200x1601,
    id: uuid.v4(),
    type: 'art',
    category: 'abstract_art',
    description: 'an abstract artwork to make you think',
    comments: [],
    forSale: true,
    price: 100.0,
    tools: ['Brush', 'Acrylic Paint'],
    tags: ['abstract', 'art', 'colorful'],
    dimensions: Dimension(width: 100, height: 200),
  ),
  Artwork(
    title: 'Ethereal Enchantment',
    artist: 'Sophia Anderson',
    imageUrl: ImageConstant.imgRectangle11200x1602,
    id: uuid.v4(),
    type: 'art',
    category: 'african_art',
    description: 'an african resonating with the world',
    comments: [],
    forSale: true,
    price: 200.0,
    tools: ['Oil'],
    tags: ['african', 'art'],
    dimensions: Dimension(width: 150, height: 200),
  ),
  Artwork(
    title: 'Surreal Void',
    artist: 'Jenifer Johnson',
    imageUrl: ImageConstant.imgRectangle11200x1603,
    id: uuid.v4(),
    type: 'ptg',
    category: 'african_art',
    description: 'an african resonating with the world',
    comments: [],
    forSale: true,
    price: 300.0,
    tools: ['Pastel', 'Watercolor'],
  ),
  Artwork(
      title: 'Trailing Edge',
      artist: 'Mia Thomson',
      imageUrl: ImageConstant.imgRectangle11200x1604,
      id: uuid.v4(),
      type: 'pho',
      category: 'photography',
      description: "that good photo you cant stop looking at!",
      comments: [],
      tools: ['camera']),
  Artwork(
      title: 'Trailing Edge',
      artist: 'Oliver Reynolds',
      imageUrl: ImageConstant.imgRectangle11200x1605,
      id: uuid.v4(),
      type: 'pho',
      category: 'photography',
      description: "that good photo you cant stop looking at!",
      comments: [],
      forSale: true,
      price: 100.0,
      tools: ['camera']),
  Artwork(
    title: 'Shrewd Pursuit',
    artist: 'Oliver Reynolds',
    imageUrl: ImageConstant.imgRectangle11200x1606,
    id: uuid.v4(),
    type: 'art',
    category: 'abstract_art',
    description: "more abstract artwork to make you think",
    comments: [],
    forSale: false,
    tools: ['Brush', 'Acrylic Paint'],
    tags: ['abstract', 'art', 'colorful'],
    dimensions: Dimension(width: 100, height: 200),
  ),
  Artwork(
    title: 'Trailing Edge',
    artist: 'Oliver Reynolds',
    imageUrl: ImageConstant.imgRectangle11200x1607,
    id: uuid.v4(),
    type: 'scl',
    category: 'african_art',
    description: "more abstract artwork to make you think",
    comments: [],
    forSale: true,
    price: 800.0,
    tools: ['Charcoal'],
  ),
  Artwork(
    title: 'Given Direction',
    artist: 'Mia Thomson',
    imageUrl: ImageConstant.imgRectangle11200x1607,
    id: uuid.v4(),
    type: 'art',
    category: 'abstract_art',
    description: "more abstract artwork to make you think",
    comments: [],
    forSale: false,
    tools: ['Brush', 'Pastel'],
  ),
  Artwork(
    title: 'Given Direction',
    artist: 'Mia Thomson',
    imageUrl: ImageConstant.imgRectangle11200x1607,
    id: uuid.v4(),
    type: 'art',
    category: 'pop_art',
    description: "let the world be filled with art",
    comments: [],
    forSale: true,
    price: 900.0,
    tools: ['Brush', 'Pastel'],
  ),
  Artwork(
    title: 'drop of water',
    artist: 'Mia Thomson',
    imageUrl: ImageConstant.imgRectangle11200x1607,
    id: uuid.v4(),
    type: 'ptg',
    category: 'pop_art',
    description: "let the world be filled with art",
    comments: [],
    forSale: false,
    tools: ['Brush', 'Pastel', 'Watercolor'],
  ),
];

class Comment {
  final String text;
  final String userName;
  final DateTime timestamp;
  Comment(
      {required this.text, required this.userName, required this.timestamp});
  Map<String, dynamic> toJson() => {
        'text': text,
        'userName': userName,
        'timestamp': timestamp.toIso8601String(),
      };
  Comment.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        userName = json['userName'],
        timestamp = DateTime.parse(json['timestamp']);
}

class Dimension {
  final double width;
  final double height;
  Dimension({required this.width, required this.height});
// convert a dimension to Map
  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
    };
  }
  // create a new Dimension from a map

  static Dimension fromJson(Map<String, dynamic> json) {
    return Dimension(
      width: json['width'],
      height: json['height'],
    );
  }
}
