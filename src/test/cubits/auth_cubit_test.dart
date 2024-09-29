
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/cubits/auth_cubit.dart';
import 'package:my_flutter_app/cubits/auth_state.dart';
import 'package:my_flutter_app/models/user.dart';

class MockUser extends Mock implements User {}

void main() {
	group('AuthCubit', () {
		late AuthCubit authCubit;
		late MockUser mockUser;

		setUp(() {
			authCubit = AuthCubit();
			mockUser = MockUser();
		});

		tearDown(() {
			authCubit.close();
		});

		test('initial state is AuthInitial', () {
			expect(authCubit.state, AuthInitial());
		});

		blocTest<AuthCubit, AuthState>(
			'emits [Authenticated] when login is successful',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [Authenticated(user: User(email: 'test@example.com', password: 'password123'))],
		);

		blocTest<AuthCubit, AuthState>(
			'emits [Unauthenticated] when logout is called',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [Unauthenticated()],
		);
	});
}
