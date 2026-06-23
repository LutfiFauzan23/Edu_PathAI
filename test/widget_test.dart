import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:edu_path/screens/login_screen.dart';
import 'package:edu_path/theme/app_theme.dart';

void main() {
  testWidgets('LoginScreen tampil dengan benar', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: buildAppTheme(),
        home: const LoginScreen(),
      ),
    );
    await tester.pump();

    expect(find.text('EduPath AI'), findsOneWidget);
    expect(find.text('Masuk'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
  });
}
