import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static show(BuildContext context, String message, IconData? leadingIcon,
      String? buttonText) {
    final snackBar = SnackBar(
      backgroundColor: Color(0xFFFEE9E9), // Your background color
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.black.withOpacity(0.08),
          width: 0.5,
        ),
      ),
      elevation: 4,
      content: Row(
        children: [
          if (leadingIcon != null) Icon(leadingIcon),
          SizedBox(width: 8), // Add some spacing between the icon and the text
          Expanded(child: Text(message, style: TextStyle(color: Colors.black))),
          if (buttonText != null)
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                Get.back();
                
              },
              child: Text(buttonText),
            ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
