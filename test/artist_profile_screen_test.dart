import 'package:artohmapp/presentation/artist_profile_screen/artist_profile_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
void main() {
  testWidgets('Test ArtistProfileScreen', (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(home: ArtistProfileScreen()));

    // Add your test assertions here
  });
}