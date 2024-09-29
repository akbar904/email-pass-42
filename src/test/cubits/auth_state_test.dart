
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.my_flutter_app/cubits/auth_state.dart';

// Mock classes if any

void main() {
	group('AuthState', () {
		test('supports value equality', () {
			expect(AuthInitial(), AuthInitial());
			expect(Authenticated(), Authenticated());
			expect(Unauthenticated(), Unauthenticated());
		});

		test('AuthInitial props are correct', () {
			expect(AuthInitial().props, []);
		});

		test('Authenticated props are correct', () {
			expect(Authenticated().props, []);
		});

		test('Unauthenticated props are correct', () {
			expect(Unauthenticated().props, []);
		});
	});
}
