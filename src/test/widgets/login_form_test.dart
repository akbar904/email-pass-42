
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/widgets/login_form.dart';

class MockAuthCubit extends Mock implements AuthCubit {}

void main() {
	group('LoginForm Widget Tests', () {
		testWidgets('displays email and password fields and login button', (WidgetTester tester) async {
			final authCubit = MockAuthCubit();

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LoginForm(
							authCubit: authCubit,
						),
					),
				),
			);

			expect(find.byType(TextFormField), findsNWidgets(2));
			expect(find.byType(ElevatedButton), findsOneWidget);
		});

		testWidgets('shows error messages when fields are empty', (WidgetTester tester) async {
			final authCubit = MockAuthCubit();

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LoginForm(
							authCubit: authCubit,
						),
					),
				),
			);

			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			expect(find.text('Email is required'), findsOneWidget);
			expect(find.text('Password is required'), findsOneWidget);
		});

		testWidgets('calls authCubit.login when form is valid', (WidgetTester tester) async {
			final authCubit = MockAuthCubit();
			when(() => authCubit.login(any(), any())).thenAnswer((_) async {});

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LoginForm(
							authCubit: authCubit,
						),
					),
				),
			);

			await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
			await tester.enterText(find.byKey(Key('passwordField')), 'password123');
			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			verify(() => authCubit.login('test@example.com', 'password123')).called(1);
		});
	});
}
