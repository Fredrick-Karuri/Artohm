import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';

class CustomRow extends StatelessWidget {
  final String label;
  final String value;

  CustomRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, top: 24.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: theme.textTheme.bodyLarge),
          Text(value, style: CustomTextStyles.bodyLargeLight),
        ],
      ),
    );
  }
}
