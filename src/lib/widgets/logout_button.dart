
import 'package:flutter/material.dart';
import 'package:my_flutter_app/cubits/auth_cubit.dart';

class LogoutButton extends StatelessWidget {
	final AuthCubit authCubit;

	const LogoutButton({Key? key, required this.authCubit}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return ElevatedButton(
			onPressed: () {
				authCubit.logout();
			},
			child: const Text('Logout'),
		);
	}
}
