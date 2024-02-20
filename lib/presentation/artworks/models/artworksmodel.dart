import 'package:artohmapp/core/utils/image_constant.dart';

class Artwork {
  final String title;
  final String artist;
  final String imageUrl;
  final String id;
  final String type;
  final String category;
  final String description;
  int likes;
  List<Comment> comments;

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
  });
  @override
  String toString() {
    return 'Artwork(id: $id, imageUrl: $imageUrl)';
  }
}

List<Artwork> artworks = [
  Artwork(
    title: 'Ethereal Enchantment',
    artist: 'Sophia Anderson',
    imageUrl: ImageConstant.imgRectangle11200x1601,
    id: 'art101',
    type: 'art',
    category: 'abstract_art',
    description: 'an abstract artwork to make you think',
    comments: [],
  ),
  Artwork(
    title: 'Ethereal Enchantment',
    artist: 'Sophia Anderson',
    imageUrl: ImageConstant.imgRectangle11200x1602,
    id: 'art100',
    type: 'art',
    category: 'african_art',
    description: 'an african resonating with the world',
    comments: [],
  ),
  Artwork(
    title: 'Surreal Void',
    artist: 'Jenifer Johnson',
    imageUrl: ImageConstant.imgRectangle11200x1603,
    id: 'ptg101',
    type: 'ptg',
    category: 'african_art',
    description: 'an african resonating with the world',
    comments: [],
  ),
  Artwork(
    title: 'Trailing Edge',
    artist: 'Mia Thomson',
    imageUrl: ImageConstant.imgRectangle11200x1604,
    id: 'pho101',
    type: 'pho',
    category: 'photography',
    description: "that good photo you cant stop looking at!",
    comments: [],
  ),
  Artwork(
    title: 'Trailing Edge',
    artist: 'Oliver Reynolds',
    imageUrl: ImageConstant.imgRectangle11200x1605,
    id: 'pho102',
    type: 'pho',
    category: 'photography',
    description: "that good photo you cant stop looking at!",
    comments: [],
  ),
  Artwork(
    title: 'Shrewd Pursuit',
    artist: 'Oliver Reynolds',
    imageUrl: ImageConstant.imgRectangle11200x1606,
    id: 'art103',
    type: 'art',
    category: 'abstract_art',
    description: "more abstract artwork to make you think",
    comments: [],
  ),
  Artwork(
    title: 'Trailing Edge',
    artist: 'Oliver Reynolds',
    imageUrl: ImageConstant.imgRectangle11200x1607,
    id: 'art104',
    type: 'ptg',
    category: 'abstract_art',
    description: "more abstract artwork to make you think",
    comments: [],
  ),
  Artwork(
    title: 'Given Direction',
    artist: 'Mia Thomson',
    imageUrl: ImageConstant.imgRectangle11200x1607,
    id: 'art105',
    type: 'art',
    category: 'abstract_art',
    description: "more abstract artwork to make you think",
    comments: [],
  ),
  Artwork(
    title: 'Given Direction',
    artist: 'Mia Thomson',
    imageUrl: ImageConstant.imgRectangle11200x1607,
    id: 'art106',
    type: 'art',
    category: 'pop_art',
    description: "let the world be filled with art",
    comments: [],
  ),
  Artwork(
    title: 'drop of water',
    artist: 'Mia Thomson',
    imageUrl: ImageConstant.imgRectangle11200x1607,
    id: 'art107',
    type: 'ptg',
    category: 'pop_art',
    description: "let the world be filled with art",
    comments: [],
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
