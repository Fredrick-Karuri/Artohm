import 'controller/app_navigation_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              Container(
                decoration: AppDecoration.fillBackground,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 10.v),
                        child: Text(
                          "lbl_app_navigation".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: appTheme.black900,
                              fontSize: 20.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Text(
                          "msg_check_your_app_s".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: appTheme.blueGray400,
                              fontSize: 16.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.v),
                    Divider(
                        height: 1.v, thickness: 1.v, color: appTheme.black900)
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: AppDecoration.fillBackground,
                    child: Column(
                      children: [
                        onboarding(),
                        collaborateItem(),
                        collaborate2(),
                        notifications(),
                        settings2(),
                        settingsItem(),
                        privacy(),
                        userProfileContainer(),
                        artDiscovery(),
                        artistProfile(),
                        marketplace(),
                        artwork(),
                        community(),
                        onboarding2(),
                        onboardingOne(),
                        signup(),
                        signupOne(),
                        signIn2(),
                        forgotPassword(),
                        editProfile(),
                        uploadArtwork(),
                        uploadArtwork2(),
                        createCollection2(),
                        artCommunityEngagement(),
                        modal(),
                        modalOne(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  modalOne() {
    return GestureDetector(
      onTap: () {
        onTapModalOne();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                    child: Text("lbl_modal_one".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 20.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400)))),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  modal() {
    return GestureDetector(
        onTap: () {
          onTapModal();
        },
        child: Container(
            decoration: AppDecoration.fillBackground,
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 10.v),
                      child: Text("lbl_modal".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: appTheme.black900,
                              fontSize: 20.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400)))),
              SizedBox(height: 5.v),
              Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
            ])));
  }

  artCommunityEngagement() {
    return GestureDetector(
      onTap: () {
        onTapArtCommunityEngagement();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                    child: Text("msg_art_community_engagement".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 20.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400)))),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  createCollection2() {
    return GestureDetector(
      onTap: () {
        onTapCreateCollection();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                    child: Text("msg_createcollection2".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 20.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400)))),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  uploadArtwork2() {
    return GestureDetector(
        onTap: () {
          onTapUploadArtworkTwo();
        },
        child: Container(
            decoration: AppDecoration.fillBackground,
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 10.v),
                      child: Text("msg_upload_artwork_two".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: appTheme.black900,
                              fontSize: 20.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400)))),
              SizedBox(height: 5.v),
              Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
            ])));
  }

  uploadArtwork() {
    return GestureDetector(
        onTap: () {
          onTapUploadArtwork();
        },
        child: Container(
            decoration: AppDecoration.fillBackground,
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 10.v),
                      child: Text("lbl_upload_artwork".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: appTheme.black900,
                              fontSize: 20.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400)))),
              SizedBox(height: 5.v),
              Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
            ])));
  }

  editProfile() {
    return GestureDetector(
        onTap: () {
          onTapEditProfile();
        },
        child: Container(
            decoration: AppDecoration.fillBackground,
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 10.v),
                      child: Text("lbl_edit_profile".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: appTheme.black900,
                              fontSize: 20.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400)))),
              SizedBox(height: 5.v),
              Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
            ])));
  }

  forgotPassword() {
    return GestureDetector(
      onTap: () {
        onTapForgotpassword();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                    child: Text("lbl_forgot_password2".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 20.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400)))),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  signIn2() {
    return GestureDetector(
        onTap: () {
          onTapSignin();
        },
        child: Container(
            decoration: AppDecoration.fillBackground,
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 10.v),
                      child: Text("lbl_signin2".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: appTheme.black900,
                              fontSize: 20.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400)))),
              SizedBox(height: 5.v),
              Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
            ])));
  }

  signupOne() {
    return GestureDetector(
        onTap: () {
          onTapSignupOne();
        },
        child: Container(
            decoration: AppDecoration.fillBackground,
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 10.v),
                      child: Text("lbl_signup_one".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: appTheme.black900,
                              fontSize: 20.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400)))),
              SizedBox(height: 5.v),
              Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
            ])));
  }

  signup() {
    return GestureDetector(
      onTap: () {
        onTapSignup();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                    child: Text("lbl_signup".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 20.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400)))),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  onboardingOne() {
    return GestureDetector(
      onTap: () {
        onTapOnboardingOne();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                    child: Text("lbl_onboarding_one".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 20.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400)))),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  onboarding2() {
    return GestureDetector(
      onTap: () {
        onTapOnboarding1();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                    child: Text("lbl_onboarding".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 20.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400)))),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  community() {
    return GestureDetector(
      onTap: () {
        onTapArtcommunity();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                    child: Text("lbl_art_community".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 20.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400)))),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  artwork() {
    return GestureDetector(
      onTap: () {
        onTapArtwork();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                    child: Text("lbl_artwork".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 20.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400)))),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  marketplace() {
    return GestureDetector(
      onTap: () {
        onTapArtmarketplace();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                    child: Text("lbl_art_marketplace".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 20.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400)))),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  artistProfile() {
    return GestureDetector(
        onTap: () {
          onTapArtistprofile();
        },
        child: Container(
            decoration: AppDecoration.fillBackground,
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 10.v),
                      child: Text("lbl_artist_profile".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: appTheme.black900,
                              fontSize: 20.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400)))),
              SizedBox(height: 5.v),
              Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
            ])));
  }

  artDiscovery() {
    return GestureDetector(
      onTap: () {
        onTapArtDiscoveryContainer();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                    child: Text("msg_art_discovery".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 20.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400)))),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  userProfileContainer() {
    return GestureDetector(
      onTap: () {
        onTapUserprofileContainer();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                child: Text(
                  "msg_user_profile_container".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 20.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  privacy() {
    return GestureDetector(
      onTap: () {
        onTapPrivacy();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                child: Text(
                  "lbl_privacy".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 20.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  settingsItem() {
    return GestureDetector(
      onTap: () {
        onTapSettingsItem();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                child: Text(
                  "lbl_settingsitem".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 20.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  settings2() {
    return GestureDetector(
      onTap: () {
        onTapSettings();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                child: Text(
                  "lbl_settings2".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 20.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  notifications() {
    return GestureDetector(
      onTap: () {
        onTapNotificationsTabContainer();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                child: Text(
                  "msg_notifications".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 20.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  collaborate2() {
    return GestureDetector(
      onTap: () {
        onTapCollaborate();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                    child: Text("lbl_collaborate2".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 20.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400)))),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  collaborateItem() {
    return GestureDetector(
      onTap: () {
        onTapCollaborateItem();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                child: Text(
                  "lbl_collaborateitem".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 20.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  onboarding() {
    return GestureDetector(
      onTap: () {
        onTapOnboarding();
      },
      child: Container(
        decoration: AppDecoration.fillBackground,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                child: Text(
                  "lbl_onboarding".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 20.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 5.v),
            Divider(height: 1.v, thickness: 1.v, color: appTheme.blueGray400)
          ],
        ),
      ),
    );
  }

  /// Navigates to the onboardingScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the onboardingScreen.
  onTapOnboarding() {
    Get.toNamed(
      AppRoutes.onboardingScreen,
    );
  }

  /// Navigates to the collaborateitemScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the collaborateitemScreen.
  onTapCollaborateItem() {
    Get.toNamed(
      AppRoutes.collaborateitemScreen,
    );
  }

  /// Navigates to the collaborateScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the collaborateScreen.
  onTapCollaborate() {
    Get.toNamed(
      AppRoutes.collaborateScreen,
    );
  }

  /// Navigates to the notificationsTabContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the notificationsTabContainerScreen.
  onTapNotificationsTabContainer() {
    Get.toNamed(
      AppRoutes.notificationsTabContainerScreen,
    );
  }

  /// Navigates to the settingsScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the settingsScreen.
  onTapSettings() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }

  /// Navigates to the settingsitemScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the settingsitemScreen.
  onTapSettingsItem() {
    Get.toNamed(
      AppRoutes.settingsitemScreen,
    );
  }

  /// Navigates to the privacyScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the privacyScreen.
  onTapPrivacy() {
    Get.toNamed(
      AppRoutes.privacyScreen,
    );
  }

  /// Navigates to the userProfileContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the userProfileContainerScreen.
  onTapUserprofileContainer() {
    Get.toNamed(
      AppRoutes.userProfileContainerScreen,
    );
  }

  /// Navigates to the artDiscoveryContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artDiscoveryContainerScreen.
  onTapArtDiscoveryContainer() {
    Get.toNamed(
      AppRoutes.artDiscoveryContainerScreen,
    );
  }

  /// Navigates to the artistProfileScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artistProfileScreen.
  onTapArtistprofile() {
    Get.toNamed(
      AppRoutes.artistProfileScreen,
    );
  }

  /// Navigates to the artMarketplaceScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artMarketplaceScreen.
  onTapArtmarketplace() {
    Get.toNamed(
      AppRoutes.artMarketplaceScreen,
    );
  }

  /// Navigates to the artworkScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artworkScreen.
  onTapArtwork() {
    Get.toNamed(
      AppRoutes.artworkScreen,
    );
  }

  /// Navigates to the artCommunityScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artCommunityScreen.
  onTapArtcommunity() {
    Get.toNamed(
      AppRoutes.artCommunityScreen,
    );
  }

  /// Navigates to the onboarding1Screen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the onboarding1Screen.
  onTapOnboarding1() {
    Get.toNamed(
      AppRoutes.onboarding1Screen,
    );
  }

  /// Navigates to the onboardingOneScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the onboardingOneScreen.
  onTapOnboardingOne() {
    Get.toNamed(
      AppRoutes.onboardingOneScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the signupScreen.
  onTapSignup() {
    Get.toNamed(
      AppRoutes.signupScreen,
    );
  }

  /// Navigates to the signupOneScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the signupOneScreen.
  onTapSignupOne() {
    Get.toNamed(
      AppRoutes.signupOneScreen,
    );
  }

  /// Navigates to the signinScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the signinScreen.
  onTapSignin() {
    Get.toNamed(
      AppRoutes.signinScreen,
    );
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the forgotPasswordScreen.
  onTapForgotpassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  /// Navigates to the editProfileScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the editProfileScreen.
  onTapEditProfile() {
    Get.toNamed(
      AppRoutes.editProfileScreen,
    );
  }

  /// Navigates to the uploadArtworkScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the uploadArtworkScreen.
  onTapUploadArtwork() {
    Get.toNamed(
      AppRoutes.uploadArtworkScreen,
    );
  }

  /// Navigates to the uploadArtworkTwoScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the uploadArtworkTwoScreen.
  onTapUploadArtworkTwo() {
    Get.toNamed(
      AppRoutes.uploadArtworkTwoScreen,
    );
  }

  /// Navigates to the createcollectionScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the createcollectionScreen.
  onTapCreateCollection() {
    Get.toNamed(
      AppRoutes.createcollectionScreen,
    );
  }

  /// Navigates to the artCommunityEngagementScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artCommunityEngagementScreen.
  onTapArtCommunityEngagement() {
    Get.toNamed(
      AppRoutes.artCommunityEngagementScreen,
    );
  }

  /// Navigates to the modalScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the modalScreen.
  onTapModal() {
    Get.toNamed(
      AppRoutes.modalScreen,
    );
  }

  /// Navigates to the modalOneScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the modalOneScreen.
  onTapModalOne() {
    Get.toNamed(
      AppRoutes.modalOneScreen,
    );
  }
}
