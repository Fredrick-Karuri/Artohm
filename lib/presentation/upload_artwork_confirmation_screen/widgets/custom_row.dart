import 'package:artohmapp/theme/theme_helper.dart';
import 'package:flutter/material.dart';

import '../../../theme/custom_text_style.dart';

class CustomRowWidget extends StatelessWidget {
  final String title;
  final String text;

  CustomRowWidget({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              title,
              style: CustomTextStyles.titleMediumLatoOnBackground,
            ),
          ),
          SizedBox(width: 16), // You can adjust the space between the texts
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(bottom: 2.0),
              child: Text(
                text,
                style: theme.textTheme.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
