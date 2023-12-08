import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/splashscreen/controller/splashscreen_controller.dart';
import 'package:flutter/material.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
