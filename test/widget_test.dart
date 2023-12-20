// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/art_community_screen/controller/art_community_controller.dart';
import 'package:artohmapp/presentation/artwork_screen/artwork_screen.dart';
import 'package:artohmapp/presentation/artwork_screen/controller/artwork_controller.dart';
import 'package:artohmapp/presentation/modal_screen/modal_screen.dart';
import 'package:artohmapp/widgets/custom_appbar_component.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:artohmapp/main.dart';

void main() {

// testing the customOutlinedButton
  testWidgets(
    'CustomOutlinedButton shows the button',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: CustomOutlinedButton(
              onTap: () {},
              text: 'test',
            ),
          ),
        ),
      );

      expect(find.byType(CustomOutlinedButton), findsOneWidget);
    },
  );


  // testing the modalScreen
  // testWidgets(
  //   'Modal screen shows modal',
  //   (WidgetTester tester) async {
  //     await tester.runAsync(
  //       () async {
  //         // build the app and trigger a frame
  //         await tester.pumpWidget(ModalScreen());

  //         // verify that modalscreen desplays a modal
  //         expect(find.byType(ModalScreen), findsOneWidget);
  //       },
  //     );
  //   },
  // );
  // testing the artworkScreen
  // testWidgets(
  //   'Artwork screen shows the artwork',
  //   (WidgetTester tester) async {
  //     Get.put(ArtworkController());
  //     // build the app and trigger a frame
  //     await tester.pumpWidget(GetMaterialApp(home: ArtworkScreen(),));

  //     // Verify that ArtworkScreen displays the artwork.
  //     expect(find.byType(ArtworkScreen), findsOneWidget);
  //   },
  // );

  // testWidgets(
  //   'Custom app bar component shows the app bar',
  //   (WidgetTester tester) async {
  //     await tester.pumpWidget(
  //       GetMaterialApp(
  //         home: Scaffold(
  //           appBar: CustomAppBarComponent(
  //             title: 'test',
  //           ),
  //         ),
  //       ),
  //     );

  //     expect(find.byType(CustomAppBarComponent), findsOneWidget);
  //   },
  // );

//   testWidgets('back button delay test', (WidgetTester tester) async {
//     await tester.pumpWidget(
//       MaterialApp(
//         home: Scaffold(
//           appBar: CustomAppBarComponent(
//             onBackPressed: (){Get.back();},
//             hasTitle: true,
//             hasTrailingIcon: true,
//           ),
//         ),
//       ),
//     );
// // simulate the back button pressing
//     final dynamic widgetAppState = tester.state(find.byType(WidgetsApp));
//     await widgetAppState.didPopRoute();
// // wait for a while
//     await tester.pumpAndSettle();

//     expect(find.byType(CustomAppBarComponent), findsNothing);
//   });


  
  // Add more test cases as needed for other parts of the code block
}


  // testWidgets(
  //   'Counter increments smoke test',
  //   (WidgetTester tester) async {
  //     // Build our app and trigger a frame.
  //     await tester.pumpWidget(
  //       MyApp(
  //         onboardingCompleted: true,
  //       ),
  //     );

  //     // Verify that our counter starts at 0.
  //     expect(find.text('0'), findsOneWidget);
  //     expect(find.text('1'), findsNothing);

  //     // Tap the '+' icon and trigger a frame.
  //     await tester.tap(find.byIcon(Icons.add));
  //     await tester.pump();

  //     // Verify that our counter has incremented.
  //     expect(find.text('0'), findsNothing);
  //     expect(find.text('1'), findsOneWidget);
  //   },
  // );
