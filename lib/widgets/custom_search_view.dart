import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:flutter/material.dart';

class SearchController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  final ArtworksController artworksController = Get.find();
  List<Artwork> results = [];
  void clearText() {
    textEditingController.clear();
    update();
  }
  

  void search(String query) {
    results = artworksController.artworks
        .where((artwork) =>
            artwork.title.toLowerCase().contains(query.toLowerCase()) ||
            artwork.artist.toLowerCase().contains(query.toLowerCase()) ||
            artwork.type.toLowerCase().contains(query.toLowerCase()))
        .toList();

    update();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}

SearchController searchController = SearchController();

class CustomSearchView extends StatelessWidget {
  // final SearchController searchController = Get.find();

  CustomSearchView({
    Key? key,
    this.alignment,
    this.width,
    this.margin,
    required this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final EdgeInsetsGeometry? margin;

  final TextEditingController controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: searchViewWidget,
          )
        : searchViewWidget;
  }

  Widget get searchViewWidget => Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back(id: 1);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: controller,
                      focusNode: focusNode ?? FocusNode(),
                      autofocus: autofocus!,
                      style: textStyle ??
                          CustomTextStyles.titleSmallLatoSecondaryMedium,
                      keyboardType: textInputType,
                      maxLines: maxLines ?? 1,
                      decoration: decoration,
                      validator: validator,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        SearchController searchController = Get.put(
                          SearchController(),
                        );

                        searchController.search(controller.text);
                      },
                      child: Text(
                        "Search",
                        style: TextStyle(color: theme.colorScheme.tertiary),
                      ))
                ],
              ),
              Expanded(
                  child: 
                  ListView.builder(
                    
                    itemCount: searchController.results.length,
                    itemBuilder: (context, index) {
                      final artwork = searchController.results[index];
                      return ListTile(
                        leading: Image.asset(artwork.imageUrl),
                        title: Text(artwork.title),
                        subtitle: Text('By ${artwork.artist}'),
                      );
                    },
                  ),
                ),
              
            ],
          ),
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "Type to Search ",
        hintStyle:
            hintStyle ?? CustomTextStyles.titleSmallLatoSecondaryMedium,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix ??
            Padding(
              padding: EdgeInsets.only(
                right: 15.h,
              ),
              child: IconButton(
                onPressed: () {
                  controller.clear();
                },
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.only(
              left: 16.v,
              top: 19.v,
              right: 19.h,
              bottom: 19.v,
            ),
        fillColor: fillColor,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.h),
              borderSide: BorderSide(
                color: theme.colorScheme.secondary,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.h),
              borderSide: BorderSide(
                color: theme.colorScheme.secondary,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.h),
              borderSide: BorderSide(
                color: theme.colorScheme.secondary,
                width: 1,
              ),
            ),
      );
}

backButton() {
  Get.toNamed(
    AppRoutes.homePage,
  );
}
