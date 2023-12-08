import '../controller/createcollection_controller.dart';
import '../models/selectartwork_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectartworkItemWidget extends StatefulWidget {
  final SelectartworkItemModel selectartworkItemModelObj;

  SelectartworkItemWidget(
    this.selectartworkItemModelObj, {
    Key? key,
  }) : super(key: key);

  @override
  _SelectartworkItemWidgetState createState() =>
      _SelectartworkItemWidgetState();
}

class _SelectartworkItemWidgetState extends State<SelectartworkItemWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(bottom: 2.v),
          child: Column(
            children: [
              Obx(() => widget.selectartworkItemModelObj.imagePath?.value != null
                      ? Image.asset(widget.selectartworkItemModelObj.imagePath!.value)
                      : Container() // This will be used when imagePath is null
                  ),
              SizedBox(height: 3.v),
              Obx(
                () => Text(
                  widget.selectartworkItemModelObj.txt!.value,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium,
                ),
              ),
              SizedBox(height: 15.v),
              FilledButton(
                onPressed: () {
                  setState(() {
                    _isSelected = !_isSelected;
                  });
                },
                child: Icon( 
                  _isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                  size: 32, color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

