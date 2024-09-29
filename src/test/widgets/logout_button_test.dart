
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:my_flutter_app/widgets/logout_button.dart';
import 'package:my_flutter_app/cubits/auth_cubit.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LogoutButton Widget Tests', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		testWidgets('displays a logout button with text "Logout"', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LogoutButton(authCubit: mockAuthCubit),
					),
				),
			);

			expect(find.text('Logout'), findsOneWidget);
			expect(find.byType(ElevatedButton), findsOneWidget);
		});

		testWidgets('triggers logout when button is pressed', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LogoutButton(authCubit: mockAuthCubit),
					),
				),
			);

			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			verify(() => mockAuthCubit.logout()).called(1);
		});
	});
}
