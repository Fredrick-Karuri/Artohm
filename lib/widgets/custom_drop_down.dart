import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown(
      {Key? key,
      this.alignment,
      this.width,
      this.margin,
      this.focusNode,
      this.icon,
      this.autofocus = true,
      this.textStyle,
      this.items,
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
      this.onChanged,
      this.dropdownColor = Colors.blue})
      : super(
          key: key,
        );
  final Color dropdownColor;
  final Alignment? alignment;

  final double? width;

  final EdgeInsetsGeometry? margin;

  final FocusNode? focusNode;

  final Widget? icon;

  final bool? autofocus;

  final TextStyle? textStyle;

  final List<SelectionPopupModel>? items;

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
  final FormFieldValidator<int>? validator;

  final Function(int)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: dropDownWidget,
          )
        : dropDownWidget;
  }

  Widget get dropDownWidget => Padding(
        padding: const EdgeInsets.only(
          right: 8,
          bottom: 8,
          top: 8,
        ),
        child: Container(
          width: width ?? double.maxFinite,
          margin: margin,
          child: DropdownButtonFormField<int>(
            focusNode: focusNode ?? FocusNode(),
            icon: icon,
            autofocus: autofocus!,
            style: textStyle ?? theme.textTheme.bodyMedium,
            items: items?.map((SelectionPopupModel item) {
              return DropdownMenuItem<int>(
                value: item.id,
                child: Text(
                  item.title,
                  overflow: TextOverflow.ellipsis,
                  style: hintStyle ?? theme.textTheme.bodyMedium,
                ),
              );
            }).toList(),
            decoration: decoration,
            validator: validator,
            onChanged: (int? value) {
              if (value != null && onChanged != null) {
                onChanged!(value);
              }
            },

            // onChanged: onChanged,
            dropdownColor: dropdownColor,
          ),
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? theme.textTheme.bodyMedium,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.only(left: 12.h, top: 8.v, bottom: 8.v, right: 8.v),
        fillColor: fillColor,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide(
                color: appTheme.black900,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide(
                color: appTheme.black900,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide(
                color: appTheme.black900,
                width: 1,
              ),
            ),
      );
}

/// Extension on [CustomDropDown] to facilitate inclusion of all types of border style etc
extension DropDownStyleHelper on CustomDropDown {
  static OutlineInputBorder get fillSecondaryOpacity => OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get outlineBlackTL81 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide(
          color: appTheme.black900.withOpacity(0.87),
          width: 1,
        ),
      );
}

        // child: Container(
        //   width: width ?? double.maxFinite,
        //   margin: margin,
        //   child: DropdownButtonFormField<SelectionPopupModel>(
        //     focusNode: focusNode ?? FocusNode(),
        //     icon: icon,
        //     autofocus: autofocus!,
        //     style: textStyle ?? theme.textTheme.bodyMedium,
        //     items: items?.map((SelectionPopupModel item) {
        //       return DropdownMenuItem<SelectionPopupModel>(
        //         value: item,
        //         child: Text(
        //           item.title,
        //           overflow: TextOverflow.ellipsis,
        //           style: hintStyle ?? theme.textTheme.bodyMedium,
        //         ),
        //       );
        //     }).toList(),
        //     decoration: decoration,
        // validator: validator,
        //     onChanged: (value) {
        //       onChanged!(value!);
        //     },
        //     dropdownColor: dropdownColor,
        //   ),
        // ),