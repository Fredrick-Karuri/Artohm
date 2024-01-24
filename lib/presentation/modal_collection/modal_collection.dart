import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';

void collectionModal() {
  Get.bottomSheet(
    SingleChildScrollView(
      child: FractionallySizedBox(
        widthFactor: 0.94,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFEE9E9),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            border: Border.all(
              color: Color.fromRGBO(245, 140, 140, 0.075),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                blurRadius: 4.0,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 13.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Abstract Wonders',
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 75,
                    height: 32,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF007BFF)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Public',
                          style: TextStyle(
                            color: Color(0xFF007BFF),
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                            height: 0.19,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              modalArtworks(),
              SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Collection Description',
                    style: CustomTextStyles.titleMediumLato,
                  ),
                  // style: CustomTextStyles.titleMediumLato,

                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      child: Text(
                          'Embrace the world of abstraction with our "Abstract Masterpieces" collection. Delve into the realm of non-representational art, where colors, shapes, and forms take center stage. '))
                ],
              ),
              ctaButtons(),
            ],
          ),
        ),
      ),
    ),
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
  );
}

ctaButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: CustomOutlinedButton(
          text: "Edit Collection",
          margin: EdgeInsets.only(top: 23.v),
          buttonTextStyle: CustomTextStyles.titleSmallLatoRed300Medium,
          onTap: () {
            // onTapCreate();
          },
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        child: CustomElevatedButton(
          text: "msg_create_collection".tr,
          margin: EdgeInsets.only(
            top: 23.v,
          ),
          buttonTextStyle: CustomTextStyles.titleSmallLatoWhiteA700Medium,
          onTap: () {
            // onTapCreate();
          },
        ),
      ),
    ],
  );
}

modalArtworks() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '12 artworks',
        style: CustomTextStyles.titleMediumLato,
      ),
      SizedBox(
        height: 8,
      ),
      Container(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 10),
              width: 100.0,
              child: Image.asset(ImageConstant.imgRectangle11200x1604),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              width: 100.0,
              child: Image.asset(ImageConstant.imgRectangle11200x1604),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              width: 100.0,
              child: Image.asset(ImageConstant.imgRectangle11200x1604),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              width: 100.0,
              child: Image.asset(ImageConstant.imgRectangle11200x1604),
            ),
          ],
        ),
      ),
    ],
  );
}
