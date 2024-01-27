import 'package:artohmapp/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../widgets/onboarding_appbar.dart';
import 'controller/signin_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/core/utils/validation_functions.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:artohmapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:artohmapp/domain/googleauth/google_auth_helper.dart';
import 'package:artohmapp/domain/facebookauth/facebook_auth_helper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ignore_for_file: must_be_immutable
class SigninScreen extends GetWidget<SigninController> {
  SigninScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: OnboardingAppBar(
          text: 'Hello Again!',
          showLeadingIcon: true,
          showText: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 16.h, top: 64.v, right: 16.h),
              child: Column(
                children: [
                  socialsLogin(),
                  Padding(
                    padding: EdgeInsets.only(top: 24.v, bottom: 24),
                    child: Column(
                      children: [
                        // name(),
                        email(),
                        password(),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.v),
                  ctaBtns(),
                  SizedBox(height: 16.v),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 2.v, right: 10),
                          child: Text("msg_don_t_have_an_account".tr,
                              style: CustomTextStyles.bodyLargeRoboto),
                        ),
                        TextButton(
                          onPressed: () {
                            onTapCreateone();
                          },
                          child: Text(
                            ' Create One',
                            style: TextStyle(
                                color: appTheme.lightBlueA700, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ctaBtns() {
    return Column(
      children: [
        login(),
        SizedBox(height: 16.v),
        CustomOutlinedButton(
          height: 42.v,
          text: "lbl_forgot_password".tr,
          buttonStyle: CustomButtonStyles.outlinePrimaryTL81,
          buttonTextStyle: CustomTextStyles.titleMediumRobotoPrimary,
          onTap: () {
            onTapForgotpassword();
          },
        ),
      ],
    );
  }

  login() {
    return CustomElevatedButton(
      height: 42.v,
      text: "lbl_login".tr,
      buttonStyle: CustomButtonStyles.fillPrimaryTL8,
      buttonTextStyle: CustomTextStyles.titleMediumRobotoWhiteA700,
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          // if all the data are correct then save the data to out variables
          _formKey.currentState!.save();

          final storage = new FlutterSecureStorage();
          // Sign in the user
          try {
            var response = await supabase.auth.signInWithPassword(
              email: controller.emailController.text,
              password: controller.passwordController.text,
            );

            if (response.user != null) {
              // onTapLogin();
              print('User signed in successfully: ${response.user!.email}');
              Get.snackbar(
                'Success',
                "Welcome",
              );
              onTapLogin();
              String? accessToken = response.session?.accessToken;
              await storage.write(key: 'accessToken', value: accessToken);
            }
          } catch (e) {
            if (e is AuthException && e.statusCode == 400) {
              print('Invalid login credentials');
              Get.snackbar(
                'Error',
                'Invalid login credentials',
              );
            } else {
              print('Error signing in:$e');
              Get.snackbar(
                'Error',
                'Error signing in ',
                backgroundColor: Colors.red.shade400,
              );
            }
          }
        }
      },
    );
  }

  socialsLogin() {
    return Column(
      children: [
        CustomOutlinedButton(
          height: 56.v,
          text: "msg_continue_with_google".tr,
          leftIcon: Container(
              margin: EdgeInsets.only(right: 30.h),
              child: CustomImageView(svgPath: ImageConstant.imgGooglelogo)),
          buttonStyle: CustomButtonStyles.outlinePrimaryTL8,
          buttonTextStyle: CustomTextStyles.titleMediumLatoRed300,
          onTap: () {
            onTapContinuewith();
          },
        ),
        SizedBox(height: 16.v),
        CustomElevatedButton(
          height: 56.v,
          text: "msg_continue_with_facebook".tr,
          leftIcon: Container(
              margin: EdgeInsets.only(right: 30.h),
              child: CustomImageView(
                  svgPath: ImageConstant.imgProfileiconsWhiteA70020x20)),
          buttonStyle: CustomButtonStyles.fillPrimaryTL8,
          buttonTextStyle: CustomTextStyles.titleMediumLatoWhiteA700,
          onTap: () {
            onTapContinuewith1();
          },
        ),
      ],
    );
  }

  password() {
    return Padding(
      padding: EdgeInsets.only(
        top: 26.v,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("lbl_password".tr, style: CustomTextStyles.titleMediumLato),
          SizedBox(height: 5.v),
          Obx(
            () => CustomTextFormField(
              controller: controller.passwordController,
              focusNode: controller.passwordFocusNode,
              hintText: "msg_enter_your_password".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              suffix: InkWell(
                  onTap: () {
                    controller.isShowPassword.value =
                        !controller.isShowPassword.value;
                  },
                  child: Container(
                      margin: EdgeInsets.all(12.h),
                      child: CustomImageView(
                          svgPath: controller.isShowPassword.value
                              ? ImageConstant.imgLightbulb
                              : ImageConstant.imgLightbulb))),
              suffixConstraints: BoxConstraints(maxHeight: 36.v),
              validator: (value) {
                String? error = isValidPassword(value);
                if (error != null) {
                  return error;
                }
                return null;
              },
              obscureText: controller.isShowPassword.value,
              contentPadding:
                  EdgeInsets.only(left: 12.h, top: 9.v, bottom: 9.v),
            ),
          ),
        ],
      ),
    );
  }

  email() {
    return Padding(
      padding: EdgeInsets.only(
        top: 26.v,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("lbl_email_address".tr, style: CustomTextStyles.titleMediumLato),
          SizedBox(height: 5.v),
          CustomTextFormField(
            controller: controller.emailController,
            focusNode: controller.emailFocusNode,
            hintText: "msg_enter_your_email".tr,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              String? error = isValidEmail(value);
              if (error != null) {
                return error;
              }
              return null;
            },
          )
        ],
      ),
    );
  }

  name() {
    return Padding(
      padding: EdgeInsets.only(
        top: 26.v,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("lbl_full_name".tr, style: CustomTextStyles.titleMediumLato),
          SizedBox(height: 5.v),
          CustomTextFormField(
            controller: controller.fullNameController,
            hintText: "msg_enter_your_full".tr,
            validator: (value) {
              String? error = isText(value);
              if (error != null) {
                return error;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }

  /// Performs a Google sign-in and returns a [GoogleUser] object.
  ///
  /// If the sign-in is successful, the [onSuccess] callback will be called with
  /// a TODO comment needed to be modified by you.
  /// If the sign-in fails, the [onError] callback will be called with the error message.
  ///
  /// Throws an exception if the Google sign-in process fails.
  onTapContinuewith() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  /// Performs a Facebook sign-in and returns a [FacebookUser] object.
  ///
  /// If the sign-in is successful, the [onSuccess] callback will be called with
  /// a TODO comment needed to be modified by you.
  /// If the sign-in fails, the [onError] callback will be called with the error message.
  ///
  /// Throws an exception if the Facebook sign-in process fails.
  onTapContinuewith1() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  /// Navigates to the artDiscoveryContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artDiscoveryContainerScreen.
  onTapLogin() {
    Get.offAllNamed(
      AppRoutes.artDiscoveryContainerScreen,
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

  /// Navigates to the signupScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the signupScreen.
  onTapCreateone() {
    Get.toNamed(
      AppRoutes.signupScreen,
    );
  }
}

          
          // var response = await Get.find<ApiClient>().loginUser(
          //     controller.emailController.text,
          //     controller.passwordController.text);
          // if (response.statusCode == 200) {
          //   // if server returns a 200 ok then parse the json
          //   var jsonResponse = jsonDecode(response.body);
          //   // use the json response to create a user session
          // } else {
          //   // if the server returns an error handle it
          //   // show an error to the user
          // }
