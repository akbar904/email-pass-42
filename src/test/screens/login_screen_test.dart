
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/screens/login_screen.dart';

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('should display login form', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));

			expect(find.byType(LoginForm), findsOneWidget);
		});

		testWidgets('should display login button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));

			final loginButtonFinder = find.text('Login');
			expect(loginButtonFinder, findsOneWidget);
		});
	});

	group('LoginForm Widget Tests', () {
		testWidgets('should display email and password fields', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginForm()));

			expect(find.byType(TextFormField), findsNWidgets(2));
			expect(find.widgetWithText(TextFormField, 'Email'), findsOneWidget);
			expect(find.widgetWithText(TextFormField, 'Password'), findsOneWidget);
		});

		testWidgets('should display login button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginForm()));

			final loginButtonFinder = find.text('Login');
			expect(loginButtonFinder, findsOneWidget);
		});
	});
}
