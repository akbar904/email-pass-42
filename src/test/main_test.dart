
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/main.dart';
import 'package:my_flutter_app/cubits/auth_cubit.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('Main App Initialization', () {
		testWidgets('should initialize the app and display LoginScreen on start', (tester) async {
			await tester.pumpWidget(MyApp());

			// Verify if LoginScreen is displayed by finding a specific text or widget
			expect(find.text('Login'), findsOneWidget);
			expect(find.text('Email'), findsOneWidget);
			expect(find.text('Password'), findsOneWidget);
		});
	});

	group('AuthCubit', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		blocTest<AuthCubit, AuthState>(
			'initial state is AuthInitial',
			build: () => authCubit,
			expect: () => [],
		);

		blocTest<AuthCubit, AuthState>(
			'emits [Authenticated] when login is successful',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [Authenticated()],
		);

		blocTest<AuthCubit, AuthState>(
			'emits [Unauthenticated] when logout is called',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [Unauthenticated()],
		);
	});

	group('MyApp Widget Tests', () {
		testWidgets('shows LoginScreen when App is initialized', (tester) async {
			await tester.pumpWidget(MyApp());

			// Verifying presence of LoginScreen widgets
			expect(find.text('Login'), findsOneWidget);
			expect(find.text('Email'), findsOneWidget);
			expect(find.text('Password'), findsOneWidget);
		});
	});
}
