import 'package:artohmapp/presentation/home_page/widgets/featured_artwork.dart';
import 'package:artohmapp/presentation/home_page/widgets/homeArtworkCard.dart';
import 'package:artohmapp/presentation/home_page/models/home_model_populated.dart';
import 'package:artohmapp/presentation/notifications_page/controller/notifications_controller.dart';
import 'package:artohmapp/presentation/notifications_page/models/notifications_model.dart';
import 'package:artohmapp/widgets/custom_search_view.dart';
import 'controller/home_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:artohmapp/widgets/custom_search_view.dart' as customSearch;

import 'widgets/home_chip.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController controller = Get.put(HomeController(HomeModel().obs));
  NotificationsController nc =
      Get.put(NotificationsController(NotificationsModel().obs));
  // final NotificationsController nc = Get.find();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: false,
              backgroundColor: theme.colorScheme.background,
              elevation: 0,
              leading: CustomImageView(
                svgPath: ImageConstant.imgArtohmlogo,
                margin: EdgeInsets.only(
                  left: 18.h,
                ),
                height: 40.v,
                width: 30.h,
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.fromLTRB(9.v, 9.v, 9.v, 9.v),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 32.h),
                      IconButton(
                        icon: Icon(
                          Icons.search_outlined,
                          color: theme.colorScheme.tertiary,
                          size: 24,
                        ),
                        onPressed: () {
                          customSearch.SearchController searchController =
                              customSearch.SearchController();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomSearchView(
                                controller:
                                    searchController.textEditingController,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 32.h),
                      Stack(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              nc.reset();
                              onTapImgNotification();
                            },
                            icon: Icon(
                              Icons.notifications,
                              color: theme.colorScheme.tertiary,
                              size: 24,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Badge.count(
                              backgroundColor: theme.colorScheme.tertiary,
                              textColor: theme.colorScheme.background,
                              count: nc.notificationCount.value,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 16.h),
                      CustomImageView(
                        imagePath: ImageConstant.imgFrame72,
                        height: 36.adaptSize,
                        width: 36.adaptSize,
                        margin: EdgeInsets.only(left: 32.h, right: 12.h),
                        onTap: () {
                          onTapImgProfileoneone();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: theme.colorScheme.background,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: homeFilters(),
              )),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index == 0) {
                    return FeaturedArtworkView();
                  } else {
                    return artworksList();
                  }
                },
                childCount:
                    2, // Adjust this number based on the total number of widgets
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding featuredArtwork() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: appTheme.blueGray400.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgRectangle11400x3401,
          ),
        ),
      ),
    );
  }

  Padding artworksList() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 24),
      child: Obx(() {
        return Column(
          children: controller.categories.value.map((category) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category.categoryName,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleMedium),
                SizedBox(height: 16.v),
                // Category title
                Container(
                  height: 200.v,
                  margin: EdgeInsets.only(right: 15.h, bottom: 24.h),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.artworks.length,
                    itemBuilder: (context, index) {
                      final artwork = category.artworks[index];
                      return HomeArtworkCardNew(
                        artwork: artwork,
                      );
                    },
                  ),
                )
              ],
            );
          }).toList(),
        );
      }), // Close Obx here
    );
  }

  homeFilters() {
    HomeController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 8,
      ),
      child: Container(
        height: 40.0, // Adjust this value as needed
        child: Align(
          alignment: Alignment.centerLeft,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              for (var chip in controller.homeChipFilterList.value)
                HomeChip(chip: chip),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the notificationsTabContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the notificationsTabContainerScreen.
  onTapImgNotification() {
    Get.toNamed(
      AppRoutes.notificationsTabContainerScreen,
    );
  }

  /// Navigates to the userProfileContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the userProfileContainerScreen.
  onTapImgProfileoneone() {
    Get.toNamed(
      AppRoutes.userProfileContainerScreen,
    );
  }

  /// Navigates to the art_marketplace_screen when the action is triggered.

  onTapImgMarketplace() {
    Get.toNamed(
      AppRoutes.artMarketplaceScreen,
    );
  }
}
