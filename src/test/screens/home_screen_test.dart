
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:my_flutter_app/screens/home_screen.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('should display Home Screen with Logout Button', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HomeScreen(),
					),
				),
			);
			
			// Act
			await tester.pumpAndSettle();
			
			// Assert
			expect(find.text('Home Screen'), findsOneWidget);
			expect(find.byType(LogoutButton), findsOneWidget);
		});
	});

	group('Logout Functionality Tests', () {
		late MockAuthCubit mockAuthCubit;
		
		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});
		
		blocTest<MockAuthCubit, AuthState>(
			'should emit Unauthenticated state when logout button is pressed',
			build: () => mockAuthCubit,
			act: (cubit) {
				when(() => cubit.logout()).thenAnswer((_) async {});
				cubit.logout();
			},
			expect: () => [isA<Unauthenticated>()],
		);
	});
}
