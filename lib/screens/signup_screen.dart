import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
	final void Function(String email, String password) onRegister;

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
				_errorMessage = 'Password and Confirm Password do not match.';
			});
			return;
		}

		widget.onRegister(_email, _password);
	}

	Widget _buildInputField(String hint, bool obscureText, Function(String?) onSaved) {
		return Container(
			margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
			decoration: BoxDecoration(
				color: const Color(0xFFF4F2EF),
				borderRadius: BorderRadius.circular(12),
			),
			padding: const EdgeInsets.symmetric(horizontal: 16),
			child: TextFormField(
				obscureText: obscureText,
				decoration: InputDecoration(hintText: hint, border: InputBorder.none),
				onSaved: onSaved,
				validator: (val) => (val == null || val.isEmpty) ? 'Required' : null,
			),
		);
	}

	Widget _socialButton(String text, VoidCallback onTap) {
		return Container(
			margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
			width: double.infinity,
			child: ElevatedButton(
				onPressed: onTap,
				style: ElevatedButton.styleFrom(
					backgroundColor: const Color(0xFFF4F2EF),
					foregroundColor: Colors.black87,
					padding: const EdgeInsets.symmetric(vertical: 12),
					shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
					elevation: 0,
				),
				child: Text(text),
			),
		);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			// No AppBar for a clean look
			body: SafeArea(
				child: SingleChildScrollView(
					padding: const EdgeInsets.only(top: 24, bottom: 40),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.center,
						children: [
							const Text(
								'Sign Up',
								style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
							),
							if (_errorMessage.isNotEmpty)
								Padding(
									padding: const EdgeInsets.symmetric(vertical: 12),
									child: Text(_errorMessage, style: const TextStyle(color: Colors.red)),
								),
							Form(
								key: _formKey,
								child: Column(
									children: [
										_buildInputField("Email", false, (val) => _email = val ?? ''),
										_buildInputField("Password", true, (val) => _password = val ?? ''),
										_buildInputField("Confirm Password", true, (val) => _confirmPassword = val ?? ''),
									],
								),
							),
							const SizedBox(height: 16),
							_socialButton("Continue with Google", () => debugPrint('Google pressed')),
							_socialButton("Continue with Facebook", () => debugPrint('Facebook pressed')),
							Container(
								margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
								width: double.infinity,
								child: ElevatedButton(
									onPressed: _submit,
									style: ElevatedButton.styleFrom(
										padding: const EdgeInsets.symmetric(vertical: 16),
										backgroundColor: const Color(0xFFED772B),
										shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
									),
									child: const Text("Sign Up", style: TextStyle(fontSize: 16)),
								),
							),
							TextButton(
								onPressed: () => Navigator.pop(context),
								child: const Text('Already have an account? Log In'),
							),
						],
					),
				),
			),
		);
	}
}
