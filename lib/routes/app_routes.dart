import 'package:artohmapp/data/localStorage.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/collaborate_start_screen/binding/collaboration_start_binding.dart';
import 'package:artohmapp/presentation/collaboration_start_confirmation_screen/binding/collaboration_start_confirmation_binding.dart';
import 'package:artohmapp/presentation/collaboration_start_confirmation_screen/collaboration_start_confirmation_screen.dart';
import 'package:artohmapp/presentation/home_page/binding/home_page_binding.dart';
import 'package:artohmapp/presentation/home_page/home_page.dart';
import 'package:artohmapp/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:artohmapp/presentation/onboarding_screen/binding/onboarding_binding.dart';
import 'package:artohmapp/presentation/collaborateitem_screen/collaborateitem_screen.dart';
import 'package:artohmapp/presentation/collaborateitem_screen/binding/collaborateitem_binding.dart';
import 'package:artohmapp/presentation/collaborate_screen/collaborate_screen.dart';
import 'package:artohmapp/presentation/collaborate_screen/binding/collaborate_binding.dart';
import 'package:artohmapp/presentation/notifications_tab_container_screen/notifications_tab_container_screen.dart';
import 'package:artohmapp/presentation/notifications_tab_container_screen/binding/notifications_tab_container_binding.dart';
import 'package:artohmapp/presentation/settings_screen/settings_screen.dart';
import 'package:artohmapp/presentation/settings_screen/binding/settings_binding.dart';
import 'package:artohmapp/presentation/settings_notifications_screen/settings_notifications_screen.dart';
import 'package:artohmapp/presentation/settings_notifications_screen/binding/settingsitem_binding.dart';
import 'package:artohmapp/presentation/privacy_screen/privacy_screen.dart';
import 'package:artohmapp/presentation/privacy_screen/binding/privacy_binding.dart';
import 'package:artohmapp/presentation/signup_select_account/binding/signup_select_account_binding.dart';
import 'package:artohmapp/presentation/signup_select_account/controller/signup_select_account_controller.dart';
import 'package:artohmapp/presentation/signup_select_account/signup_select_account.dart';
import 'package:artohmapp/presentation/signup_select_account/widgets/art_enthusiast_track_view.dart';
import 'package:artohmapp/presentation/signup_select_account/widgets/artist_track_view.dart';
import 'package:artohmapp/presentation/user_profile_container_screen/widgets/collection_details_Screen.dart';
import 'package:artohmapp/presentation/your_artworks/binding/your_artworks._binding.dart';
import 'package:artohmapp/presentation/your_artworks/your_artworks.dart';
import 'package:artohmapp/widgets/splashscreen.dart';
import 'package:artohmapp/presentation/user_profile_container_screen/user_profile_container_screen.dart';
import 'package:artohmapp/presentation/user_profile_container_screen/binding/user_profile_container_binding.dart';
import 'package:artohmapp/presentation/art_discovery_container_screen/art_discovery_container_screen.dart';
import 'package:artohmapp/presentation/art_discovery_container_screen/binding/art_discovery_container_binding.dart';
import 'package:artohmapp/presentation/artist_profile_screen/artist_profile_screen.dart';
import 'package:artohmapp/presentation/artist_profile_screen/binding/artist_profile_binding.dart';
import 'package:artohmapp/presentation/art_marketplace_screen/art_marketplace_screen.dart';
import 'package:artohmapp/presentation/art_marketplace_screen/binding/art_marketplace_binding.dart';
import 'package:artohmapp/presentation/artwork_screen/artwork_screen.dart';
import 'package:artohmapp/presentation/artwork_screen/binding/artwork_binding.dart';
import 'package:artohmapp/presentation/art_community_screen/art_community_screen.dart';
import 'package:artohmapp/presentation/art_community_screen/binding/art_community_binding.dart';
import 'package:artohmapp/presentation/signup_landing_screen/signup_landing_screen.dart';
import 'package:artohmapp/presentation/signup_landing_screen/binding/signup_landing_binding.dart';
import 'package:artohmapp/presentation/signup_screen/signup_screen.dart';
import 'package:artohmapp/presentation/signup_screen/binding/signup_binding.dart';
import 'package:artohmapp/presentation/signin_screen/signin_screen.dart';
import 'package:artohmapp/presentation/signin_screen/binding/signin_binding.dart';
import 'package:artohmapp/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:artohmapp/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:artohmapp/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:artohmapp/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:artohmapp/presentation/upload_artwork_screen/upload_artwork_screen.dart';
import 'package:artohmapp/presentation/upload_artwork_screen/binding/upload_artwork_binding.dart';
import 'package:artohmapp/presentation/upload_artwork_two_screen/upload_artwork_two_screen.dart';
import 'package:artohmapp/presentation/upload_artwork_two_screen/binding/upload_artwork_two_binding.dart';
import 'package:artohmapp/presentation/createcollection_screen/createcollection_screen.dart';
import 'package:artohmapp/presentation/createcollection_screen/binding/createcollection_binding.dart';
import 'package:artohmapp/presentation/art_community_engagement_screen/art_community_engagement_screen.dart';
import 'package:artohmapp/presentation/art_community_engagement_screen/binding/art_community_engagement_binding.dart';
import 'package:artohmapp/presentation/modal_screen/modal_screen.dart';
import 'package:artohmapp/presentation/modal_screen/binding/modal_binding.dart';
import 'package:artohmapp/presentation/modal_one_screen/modal_one_screen.dart';
import 'package:artohmapp/presentation/modal_one_screen/binding/modal_one_binding.dart';
import 'package:artohmapp/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:artohmapp/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';
import 'package:artohmapp/presentation/collaborate_start_screen/collaborate_start_screen.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';

  static const String collaborateitemScreen = '/collaborateitem_screen';

  static const String collaborateScreen = '/collaborate_screen';

  static const String notificationsPage = '/notifications_page';

  static const String notificationsTabContainerScreen =
      '/notifications_tab_container_screen';

  static const String settingsScreen = '/settings_screen';

  static const String settingsitemScreen = '/settingsitem_screen';

  static const String privacyScreen = '/privacy_screen';

  static const String userProfileContainerScreen =
      '/user_profile_container_screen';

  static const String artDiscoveryContainerScreen =
      '/art_discovery_container_screen';

  static const String homePage = '/home_page';

  static const String artistProfileScreen = '/artist_profile_screen';

  static const String artMarketplaceScreen = '/art_marketplace_screen';

  static const String artworkScreen = '/artwork_screen';

  static const String artCommunityScreen = '/art_community_screen';

  static const String onboarding1Screen = '/onboarding1_screen';

  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String signupScreen = '/signup_screen';

  static const String signupOneScreen = '/signup_one_screen';

  static const String signinScreen = '/signin_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String uploadArtworkScreen = '/upload_artwork_screen';

  static const String uploadArtworkTwoScreen = '/upload_artwork_two_screen';

  static const String createcollectionScreen = '/createcollection_screen';

  static const String artCommunityEngagementScreen =
      '/art_community_engagement_screen';

  static const String modalScreen = '/modal_screen';

  static const String modalOneScreen = '/modal_one_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';
  static const String splashScreen = '/splashScreen';
  static const String newCollaborationItemPage = '/collaborate_start_screen';
  static const String collaborationStartConfirmationPage =
      '/collaboration_start_confirmation_screen';
  static const String yourArtworksPage = '/your_artworks_page';
  static const String selectAccountTypePage = '/signup_select_account';
  static const String artistTrackPage = '/artist_track_page';
  static const String artEnthusiastTrackPage = '/art_enthusiast_track_page';
  static const String collectionDetailPage = '/collection_detail_page';

  static List<GetPage> pages = [
    GetPage(
      name: onboardingScreen,
      page: () => OnboardingScreen(),
      bindings: [
        OnboardingBinding(),
      ],
    ),
    GetPage(
      name: newCollaborationItemPage,
      page: () => NewCollaborationItemPage(),
      bindings: [
        NewCollaborationItemBindings(),
      ],
    ),
    GetPage(
      name: collaborationStartConfirmationPage,
      page: () => CollaborationStartConfirmationPage(),
      bindings: [
        CollaborationStartConfirmationBindings(),
      ],
    ),
    GetPage(
      name: collaborateitemScreen,
      page: () => CollaborateitemScreen(),
      bindings: [
        CollaborateitemBinding(),
      ],
    ),
    GetPage(
      name: collaborateScreen,
      page: () => CollaborateScreen(),
      bindings: [
        CollaborateBinding(),
      ],
    ),
    GetPage(
      name: notificationsTabContainerScreen,
      page: () => NotificationsTabContainerScreen(),
      bindings: [
        NotificationsTabContainerBinding(),
      ],
    ),
    GetPage(
      name: settingsScreen,
      page: () => SettingsScreen(),
      bindings: [
        SettingsBinding(),
      ],
    ),
    GetPage(
      name: settingsitemScreen,
      page: () => SettingsitemScreen(),
      bindings: [
        SettingsitemBinding(),
      ],
    ),
    GetPage(
      name: privacyScreen,
      page: () => PrivacyScreen(),
      bindings: [
        PrivacyBinding(),
      ],
    ),
    GetPage(
      name: userProfileContainerScreen,
      page: () => UserProfileContainerScreen(FavoriteArtworksController(
      )),
      bindings: [
        UserProfileContainerBinding(),
      ],
    ),
    GetPage(
      name: artistProfileScreen,
      page: () => ArtistProfileScreen(),
      bindings: [
        ArtistProfileBinding(),
      ],
    ),
    GetPage(
      name: artMarketplaceScreen,
      page: () => ArtMarketplaceScreen(),
      bindings: [
        ArtMarketplaceBinding(),
      ],
    ),
    GetPage(
      name: artworkScreen,
      page: () => ArtworkScreen(),
      bindings: [
        ArtworkBinding(),
      ],
    ),
    GetPage(
      name: artCommunityScreen,
      page: () => ArtCommunityScreen(),
      bindings: [
        ArtCommunityBinding(),
      ],
    ),
    GetPage(
      name: signupScreen,
      page: () => SignupScreen(),
      bindings: [
        SignupLandingBinding(),
      ],
    ),
    GetPage(
      name: signupOneScreen,
      page: () => SignupOneScreen(),
      bindings: [
        SignupBinding(),
      ],
    ),
    GetPage(
      name: signinScreen,
      page: () => SigninScreen(),
      bindings: [
        SigninBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: uploadArtworkScreen,
      page: () => UploadArtworkScreen(),
      bindings: [
        UploadArtworkBinding(),
      ],
    ),
    GetPage(
      name: uploadArtworkTwoScreen,
      page: () => UploadArtworkTwoScreen(),
      bindings: [
        UploadArtworkTwoBinding(),
      ],
    ),
    GetPage(
      name: createcollectionScreen,
      page: () => CreatecollectionScreen(),
      bindings: [
        CreatecollectionBinding(),
      ],
    ),
    GetPage(
      name: artCommunityEngagementScreen,
      page: () => ArtCommunityEngagementScreen(),
      bindings: [
        ArtCommunityEngagementBinding(),
      ],
    ),
    GetPage(
      name: modalScreen,
      page: () => ModalScreen(),
      bindings: [
        ModalBinding(),
      ],
    ),
    GetPage(
      name: modalOneScreen,
      page: () => ModalOneScreen(),
      bindings: [
        ModalOneBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: artDiscoveryContainerScreen,
      page: () => ArtDiscoveryContainerScreen(),
      bindings: [
        ArtDiscoveryContainerBinding(),
      ],
    ),
    GetPage(
      name: homePage,
      page: () => HomePage(),
      bindings: [HomeBinding()],
    ),
    GetPage(
      name: initialRoute,
      page: () => OnboardingScreen(),
      bindings: [
        OnboardingBinding(),
      ],
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: yourArtworksPage,
      page: () => YourArtworksPage(),
      bindings: [
        YourArtworksBinding(),
      ],
    ),
    GetPage(
      name: selectAccountTypePage,
      page: () => SelectAccountTypePage(),
      binding: SelectAccountBinding(),
    ),
    GetPage(
      name: artistTrackPage,
      page: () => ArtistTrackPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ArtistTrackController>(() => ArtistTrackController());
      }),
    ),
    GetPage(
      name: artEnthusiastTrackPage,
      page: () => ArtEnthusiastTrackPage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut<ArtEnthusiastDetailsController>(
              () => ArtEnthusiastDetailsController());
        },
      ),
    ),
    GetPage(
      name: AppRoutes.collectionDetailPage,
      page: () => CollectionDetailScreen(
        collection: Get.arguments,
      ),
    ),
  ];
}
