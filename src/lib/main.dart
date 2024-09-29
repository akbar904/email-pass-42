
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/auth_cubit.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'My Flutter App',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: BlocProvider(
				create: (context) => AuthCubit(),
				child: AuthListener(),
			),
		);
	}
}

class AuthListener extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return BlocListener<AuthCubit, AuthState>(
			listener: (context, state) {
				if (state is Authenticated) {
					Navigator.of(context).pushReplacement(
						MaterialPageRoute(builder: (context) => HomeScreen())
					);
				} else if (state is Unauthenticated) {
					Navigator.of(context).pushReplacement(
						MaterialPageRoute(builder: (context) => LoginScreen())
					);
				}
			},
			child: BlocBuilder<AuthCubit, AuthState>(
				builder: (context, state) {
					if (state is AuthInitial || state is Unauthenticated) {
						return LoginScreen();
					} else if (state is Authenticated) {
						return HomeScreen();
					}
					return Container(); // Default case
				},
			),
		);
	}
}
