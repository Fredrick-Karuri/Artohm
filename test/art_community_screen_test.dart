import 'package:artohmapp/presentation/community_screen/art_community_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('ArtCommunityScreen should render correctly', (WidgetTester tester) async {
    // Build the ArtCommunityScreen widget inside a MaterialApp widget
    await tester.pumpWidget(MaterialApp(home: ArtCommunityScreen()));
    
    // Perform assertions on the widget's behavior
    expect(find.text('lbl_community2'), findsOneWidget);
    // Add more assertions as needed
    
    // Example: Verify that the onBackPressed callback is called when the back button is pressed
    // await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(Get.currentRoute, equals('/'));
  });
}
