
import 'package:bloc/bloc.dart';
import 'auth_state.dart';
import 'package:my_flutter_app/models/user.dart';

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) {
		// Assuming a successful login for simplicity
		final user = User(email: email, password: password);
		emit(Authenticated(user: user));
	}

	void logout() {
		emit(Unauthenticated());
	}
}
