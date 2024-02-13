import 'package:artohmapp/presentation/home_page/models/home_model.dart';
import 'package:artohmapp/presentation/home_page/models/home_model_populated.dart';
import 'package:artohmapp/presentation/home_page/widgets/home_artwork_card.dart';

import '../controller/home_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeartcolItemWidget extends StatelessWidget {
  final HomeartcolItemModel homeartcolItemModelObj;

  HomeartcolItemWidget({
    required this.homeartcolItemModelObj,
    Key? key,
  }) : super(key: key);

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Text(
            homeartcolItemModelObj.aiArtPushingTex!.value,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium,
          ),
        ),
        SizedBox(height: 15.v),
        Container(
          height: 200.v,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: homeartcolItemModelObj.imagePaths?.value.map((imagePath) {
                  return HomeArtworkCard(
                    imagePath: imagePath,
                    artwork: AnArtworkModel(),
                  );
                }).toList() ??
                [],
          ),
        ),
      ],
    );
  }
}
