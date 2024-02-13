import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';


 class SearchController extends GetxController{
  TextEditingController textEditingController = TextEditingController();
  void clearText(){
    textEditingController.clear();
    update();
  }
    
  }
class CustomSearchView extends StatelessWidget {
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Get.back(id: 1);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: appTheme.red300,
                ),
              ),
              Flexible(
                child: TextFormField(
                  controller: controller,
                  focusNode: focusNode ?? FocusNode(),
                  autofocus: autofocus!,
                  style: textStyle ??
                      CustomTextStyles.titleSmallLatoLightblueA700Medium,
                  keyboardType: textInputType,
                  maxLines: maxLines ?? 1,
                  decoration: decoration,
                  validator: validator,
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Search",
                    style: TextStyle(color: appTheme.red300),
                  ))
            ],
          ),
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "Type to Search ",
        hintStyle:
            hintStyle ?? CustomTextStyles.titleSmallLatoLightblueA700Medium,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix ??
            Padding(
              padding: EdgeInsets.only(
                right: 15.h,
              ),
              child: IconButton(

                onPressed: (){
                  controller.clear();
                },
                // onPressed: () {
                //   if (controller != null) {
                //     controller!.clear();
                //   }
                // },
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
                color: appTheme.lightBlueA700,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.h),
              borderSide: BorderSide(
                color: appTheme.lightBlueA700,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.h),
              borderSide: BorderSide(
                color: appTheme.lightBlueA700,
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
