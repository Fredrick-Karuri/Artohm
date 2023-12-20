// test for the home page

import 'package:artohmapp/widgets/custom_search_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:artohmapp/presentation/home_page/home_page.dart';

void main() {
  testWidgets(
    'Test HomePage',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: HomePage(),
        ),
      );

      // Verify that the home page is displayed
      expect(find.byType(HomePage), findsOneWidget);

      // Perform additional assertions on the home page

      // Example: Verify that the search bar is displayed
      // expect(find.byType(CustomSearchView), findsOneWidget);

   
      // Add your test assertions here
    },
  );
}
