
import 'package:equatable/equatable.dart';

// Abstract base class for all authentication states
abstract class AuthState extends Equatable {
	const AuthState();

	@override
	List<Object> get props => [];
}

// Initial state of the authentication process
class AuthInitial extends AuthState {
	const AuthInitial();

	@override
	List<Object> get props => [];
}

// State when the user is successfully authenticated
class Authenticated extends AuthState {
	const Authenticated();

	@override
	List<Object> get props => [];
}

// State when the user is not authenticated
class Unauthenticated extends AuthState {
	const Unauthenticated();

	@override
	List<Object> get props => [];
}
