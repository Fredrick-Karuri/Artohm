
// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageView extends StatelessWidget {
  ///[url] is required parameter for fetching network image
  String? url;

  ///[imagePath] is required parameter for showing png,jpg,etc image
  String? imagePath;

  ///[svgPath] is required parameter for showing svg image
  String? svgPath;

  ///[file] is required parameter for fetching image file
  File? file;

  double? height;
  double? width;
  Color? color;
  BoxFit? fit;
  final String placeHolder;
  Alignment? alignment;
  VoidCallback? onTap;
  EdgeInsetsGeometry? margin;
  BorderRadius? radius;
  BoxBorder? border;

  ///a [CustomImageView] it can be used for showing any type of images
  /// it will shows the placeholder image if image is not found on network image
  CustomImageView({
    this.url,
    this.imagePath,
    this.svgPath,
    this.file,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.placeHolder = 'assets/images/image_not_found.png',
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildWidget(),
          )
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: _buildCircleImage(),
      ),
    );
  }

  ///build the image with border radius
  _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: _buildImageWithBorder(),
      );
    } else {
      return _buildImageWithBorder();
    }
  }

  ///build the image with border and border radius style
  _buildImageWithBorder() {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(
          border: border,
          borderRadius: radius,
        ),
        child: _buildImageView(),
      );
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    if (svgPath != null && svgPath!.isNotEmpty) {
      return Container(
        height: height,
        width: width,
        child: SvgPicture.asset(
          svgPath!,
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
          color: color,
        ),
      );
    } else if (file != null && file!.path.isNotEmpty) {
      return Image.file(
        file!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
      );
    } else if (url != null && url!.isNotEmpty) {
      return CachedNetworkImage(
        height: height,
        width: width,
        fit: fit,
        imageUrl: url!,
        color: color,
        placeholder: (context, url) => Container(
          height: 30,
          width: 30,
          child: LinearProgressIndicator(
            color: Colors.grey.shade200,
            backgroundColor: Colors.grey.shade100,
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          placeHolder,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
        ),
      );
    } else if (imagePath != null && imagePath!.isNotEmpty) {
      return Image.asset(
        imagePath!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
      );
    }
    return SizedBox();
  }
}

// // ignore_for_file: must_be_immutable

// import 'dart:io';

// import 'package:artohmapp/core/app_export.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CustomImageView extends StatelessWidget {
//   final bool showBottomSheet;
//   ///[url] is required parameter for fetching network image
//   String? url;

//   ///[imagePath] is required parameter for showing png,jpg,etc image
//   String? imagePath;

//   ///[svgPath] is required parameter for showing svg image
//   String? svgPath;

//   ///[file] is required parameter for fetching image file
//   File? file;

//   double? height;
//   double? width;
//   Color? color;
//   BoxFit? fit;
//   final String placeHolder;
//   Alignment? alignment;
//   VoidCallback? onTap;
//   EdgeInsetsGeometry? margin;
//   BorderRadius? radius;
//   BoxBorder? border;

//   ///a [CustomImageView] it can be used for showing any type of images
//   /// it will shows the placeholder image if image is not found on network image
//   CustomImageView({
//     this.url,
//     this.imagePath,
//     this.svgPath,
//     this.file,
//     this.height,
//     this.width,
//     this.color,
//     this.fit,
//     this.alignment,
//     this.onTap,
//     this.radius,
//     this.margin,
//     this.border,
//     this.placeHolder = 'assets/images/image_not_found.png',
//     this.showBottomSheet=false
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: margin ?? EdgeInsets.zero,
//       child: InkWell(
//         onTap: () {
//           if (showBottomSheet) {
//           showModalBottomSheet(
//             context: context,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//               side:
//                   BorderSide(color: Colors.black.withOpacity(0.08), width: 0.5),
//             ),
//             backgroundColor: Color(0xFFFEE9E9),
//             builder: (context) {
//               return SingleChildScrollView(
//                 child: Container(
//                   width: 372,
//                   padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         'Title',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Column(
//                         children: [
//                           InkWell(
//                             onTap: () {},
//                             child: Row(
//                               children: [
//                                 IconButton(
//                                   icon: Icon(Icons.info),
//                                   onPressed: () {},
//                                 ),
//                                 Text('View Artwork Info'),
//                               ],
//                             ),
//                           ),
//                           InkWell(
//                             onTap: () {},
//                             child: Row(
//                               children: [
//                                 IconButton(
//                                   icon: Icon(Icons.favorite),
//                                   onPressed: () {},
//                                 ),
//                                 Text('Like'),
//                               ],
//                             ),
//                           ),
//                           InkWell(
//                             onTap: () {},
//                             child: Row(
//                               children: [
//                                 IconButton(
//                                   icon: Icon(Icons.add),
//                                   onPressed: () {},
//                                 ),
//                                 Text('Add to Collection'),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
        
//           }else if(onTap != null){
//             onTap!();
//           }
//         },
//         child: _buildCircleImage(),
//       ),
//     );
//   }

//   Widget _buildWidget() {
//     return Padding(
//       padding: margin ?? EdgeInsets.zero,
//       child: InkWell(
//         onTap: onTap,
//         child: _buildCircleImage(),
//       ),
//     );
//   }

//   ///build the image with border radius
//   _buildCircleImage() {
//     if (radius != null) {
//       return ClipRRect(
//         borderRadius: radius ?? BorderRadius.zero,
//         child: _buildImageWithBorder(),
//       );
//     } else {
//       return _buildImageWithBorder();
//     }
//   }

//   ///build the image with border and border radius style
//   _buildImageWithBorder() {
//     if (border != null) {
//       return Container(
//         decoration: BoxDecoration(
//           border: border,
//           borderRadius: radius,
//         ),
//         child: _buildImageView(),
//       );
//     } else {
//       return _buildImageView();
//     }
//   }

//   Widget _buildImageView() {
//     if (svgPath != null && svgPath!.isNotEmpty) {
//       return Container(
//         height: height,
//         width: width,
//         child: SvgPicture.asset(
//           svgPath!,
//           height: height,
//           width: width,
//           fit: fit ?? BoxFit.contain,
//           color: color,
//         ),
//       );
//     } else if (file != null && file!.path.isNotEmpty) {
//       return Image.file(
//         file!,
//         height: height,
//         width: width,
//         fit: fit ?? BoxFit.cover,
//         color: color,
//       );
//     } else if (url != null && url!.isNotEmpty) {
//       return CachedNetworkImage(
//         height: height,
//         width: width,
//         fit: fit,
//         imageUrl: url!,
//         color: color,
//         placeholder: (context, url) => Container(
//           height: 30,
//           width: 30,
//           child: LinearProgressIndicator(
//             color: Colors.grey.shade200,
//             backgroundColor: Colors.grey.shade100,
//           ),
//         ),
//         errorWidget: (context, url, error) => Image.asset(
//           placeHolder,
//           height: height,
//           width: width,
//           fit: fit ?? BoxFit.cover,
//         ),
//       );
//     } else if (imagePath != null && imagePath!.isNotEmpty) {
//       return Image.asset(
//         imagePath!,
//         height: height,
//         width: width,
//         fit: fit ?? BoxFit.cover,
//         color: color,
//       );
//     }
//     return SizedBox();
//   }
// }
