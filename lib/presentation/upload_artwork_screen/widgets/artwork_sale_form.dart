import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/upload_artwork_screen/controller/upload_artwork_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ArtworkSaleForm extends StatelessWidget {
  final ArtworkSaleController controller = Get.put(ArtworkSaleController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.16),
      ),
      padding: EdgeInsets.only(
        top: 8.0,
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      child: Column(
        children: [
          Obx(() => SwitchListTile(
                title: const Text(
                  'This artwork for sale',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                value: controller.isForSale.value,
                onChanged: (bool value) {
                  controller.isForSale.value = value;
                  if (!value) {
                    // Reset the price and currency when the artwork is not for sale
                    controller.price.value = 0.0;
                    controller.currency.value = '';
                  }
                },
              )),
          Obx(() => controller.isForSale.value
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButton<String>(
                      value: controller.currency.value.isEmpty
                          ? null
                          : controller.currency.value,
                      hint: Text('Choose a currency'),
                      items: controller.currencies
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        controller.currency.value = newValue ?? '';
                      },
                    ),
                    TextField(
                      controller: controller.priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Price',
                      ),
                      onChanged: (value) {
                        controller.price.value = double.tryParse(value) ?? 0.0;
                      },
                    ),
                  ],
                )
              : Container()),
        ],
      ),
    );
  }
}
