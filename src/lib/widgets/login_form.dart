
import 'package:flutter/material.dart';
import 'package:my_flutter_app/cubits/auth_cubit.dart';

class LoginForm extends StatefulWidget {
	final AuthCubit authCubit;

	const LoginForm({Key? key, required this.authCubit}) : super(key: key);

	@override
	_LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
	final _formKey = GlobalKey<FormState>();
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();

	@override
	void dispose() {
		_emailController.dispose();
		_passwordController.dispose();
		super.dispose();
	}

	void _login() {
		if (_formKey.currentState?.validate() ?? false) {
			widget.authCubit.login(_emailController.text, _passwordController.text);
		}
	}

	@override
	Widget build(BuildContext context) {
		return Form(
			key: _formKey,
			child: Column(
				children: [
					TextFormField(
						key: Key('emailField'),
						controller: _emailController,
						decoration: InputDecoration(labelText: 'Email'),
						validator: (value) {
							if (value == null || value.isEmpty) {
								return 'Email is required';
							}
							return null;
						},
					),
					TextFormField(
						key: Key('passwordField'),
						controller: _passwordController,
						obscureText: true,
						decoration: InputDecoration(labelText: 'Password'),
						validator: (value) {
							if (value == null || value.isEmpty) {
								return 'Password is required';
							}
							return null;
						},
					),
					SizedBox(height: 20),
					ElevatedButton(
						onPressed: _login,
						child: Text('Login'),
					),
				],
			),
		);
	}
}
