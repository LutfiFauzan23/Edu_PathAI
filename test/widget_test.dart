// Basic smoke test untuk LoginScreen.
//
// Catatan: kita test LoginScreen secara langsung (bukan lewat SnbpApp/main())
// supaya test ini tidak butuh Firebase.initializeApp() yang memerlukan
// koneksi & platform channel asli saat test berjalan.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:edu_path/screens/login_screen.dart';
import 'package:edu_path/theme/app_theme.dart';

void main() {
  testWidgets('LoginScreen menampilkan form login', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: buildAppTheme(),
        home: const LoginScreen(),
      ),
    );
    await tester.pump();

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
  });
}
