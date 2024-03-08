import 'dart:convert';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/localStorage.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:flutter/material.dart';

/// A controller class for the ArtworkScreen.
///
/// This class manages the state of the ArtworkScreen, including the
/// current artworkModelObj
class ArtworkController extends GetxController {
  TextEditingController commentController = TextEditingController();

  late Rx<Artwork> artwork; // Observable Artwork
  var comments = RxList<String>();
  final LocalStorageService localStorageService;

  //call th clear function


  ArtworkController(Artwork initialArtwork, this.localStorageService) {
    // Accept an Artwork instance
    artwork =
        initialArtwork.obs; // Convert the Artwork instance into an observable
    _loadComments();
  }
void addComment(String text, String userName) {
  // Create a new Comment object
  Comment comment = Comment(
    text: text,
    userName: userName,
    timestamp: DateTime.now(),
  );

  // Add the comment to the artwork's list of comments
  artwork.value.comments.add(comment);

  // Clear the text field
  commentController.clear();

  // Convert the list of Comment objects to a list of JSON strings
  List<String> jsonComments = artwork.value.comments.map((comment) => jsonEncode(comment.toJson())).toList();

  // Store the JSON comments in local storage
  localStorageService.setStringList('comments_${artwork.value.id}', jsonComments);

  // Update the artwork to trigger a UI refresh
  artwork.refresh();
}

Future<void> _loadComments() async {
  List<String>? jsonComments = await localStorageService.getStringList('comments_${artwork.value.id}');
  if (jsonComments != null) {
    // Convert the list of JSON strings back to a list of Comment objects
    artwork.value.comments = jsonComments.map((jsonComment) => Comment.fromJson(jsonDecode(jsonComment))).toList();
  }
}



  void postComment() {
    String commentText = commentController.text;

    // Add the comment to the list of comments
    comments.add(commentText);

    // Clear the text field
    commentController.clear();
  }

  int getCommentCount() {
    return artwork.value.comments.length;
  }

  @override
  void onClose() {
    super.onClose();
    commentController.dispose();
  }
}


