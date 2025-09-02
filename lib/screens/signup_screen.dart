import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
	final Function(String email, String password) onRegister;

	const SignupScreen({super.key, required this.onRegister});

	@override
	State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
	final _formKey = GlobalKey<FormState>();

	String _email = '';
	String _password = '';
	String _confirmPassword = '';
	String _errorMessage = '';

	void _submit() {
		if (!_formKey.currentState!.validate()) return;
		_formKey.currentState!.save();

		if (_password != _confirmPassword) {
			setState(() {
				_errorMessage = "Passwords do not match";
			});
			return;
		}

		widget.onRegister(_email, _password);
		Navigator.pop(context);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: const Text('Sign Up')),
			body: SafeArea(
				child: SingleChildScrollView(
					padding: const EdgeInsets.all(16),
					child: Form(
						key: _formKey,
						child: Column(
							children: [
								if (_errorMessage.isNotEmpty)
									Padding(
										padding: const EdgeInsets.only(bottom: 12),
										child: Text(
											_errorMessage,
											style: const TextStyle(color: Colors.red),
										),
									),
								TextFormField(
									decoration: const InputDecoration(
										labelText: "Email",
										filled: true,
										fillColor: Color(0xFFF4F2EF),
										border: OutlineInputBorder(),
									),
									keyboardType: TextInputType.emailAddress,
									validator: (val) {
										if (val == null || val.isEmpty) return 'Please enter email';
										if (!val.contains('@')) return 'Enter valid email';
										return null;
									},
									onSaved: (val) => _email = val!.trim(),
								),
								const SizedBox(height: 16),
								TextFormField(
									decoration: const InputDecoration(
										labelText: "Password",
										filled: true,
										fillColor: Color(0xFFF4F2EF),
										border: OutlineInputBorder(),
									),
									obscureText: true,
									validator: (val) {
										if (val == null || val.isEmpty) return 'Enter password';
										if (val.length < 6) return 'Password too short';
										return null;
									},
									onSaved: (val) => _password = val!.trim(),
								),
								const SizedBox(height: 16),
								TextFormField(
									decoration: const InputDecoration(
										labelText: "Confirm Password",
										filled: true,
										fillColor: Color(0xFFF4F2EF),
										border: OutlineInputBorder(),
									),
									obscureText: true,
									validator: (val) {
										if (val == null || val.isEmpty) return 'Confirm password';
										return null;
									},
									onSaved: (val) => _confirmPassword = val!.trim(),
								),
								const SizedBox(height: 24),
								ElevatedButton(
									onPressed: _submit,
									style: ElevatedButton.styleFrom(
										minimumSize: const Size.fromHeight(48),
										backgroundColor: const Color(0xFFED772B),
									),
									child: const Text('Sign Up'),
								),
								const SizedBox(height: 24),
								const Text('Or continue with', style: TextStyle(color: Color(0xFF897060))),
								const SizedBox(height: 12),
								Row(
									mainAxisAlignment: MainAxisAlignment.center,
									children: [
										_socialButton('Google', () => debugPrint('Google Sign Up')),
										const SizedBox(width: 16),
										_socialButton('Facebook', () => debugPrint('Facebook Sign Up')),
									],
								),
								const SizedBox(height: 24),
								TextButton(
									onPressed: () => Navigator.pop(context),
									child: const Text('Already have an account? Log In'),
								),
							],
						),
					),
				),
			),
		);
	}

	Widget _socialButton(String text, VoidCallback onTap) {
		return OutlinedButton(
			style: OutlinedButton.styleFrom(
				backgroundColor: const Color(0xFFF4F2EF),
				padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
				shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
			),
			onPressed: onTap,
			child: Text(text, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
		);
	}
}
