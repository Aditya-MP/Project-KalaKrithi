import 'package:flutter/material.dart';
import '../components/header_text.dart';
import '../components/login_input_field.dart';
import '../components/social_login_buttons.dart';
import '../components/primary_button.dart';

class LoginScreen extends StatefulWidget {
  final Function(String email) onLogin;
  final VoidCallback onNavigateToSignup;
  final bool Function(String email, String password) loginUser;

  const LoginScreen({
    super.key,
    required this.onLogin,
    required this.onNavigateToSignup,
    required this.loginUser,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _errorMessage = '';
  late LoginInputFieldState? emailFieldState;
  late LoginInputFieldState? passwordFieldState;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    if (widget.loginUser(_email, _password)) {
      widget.onLogin(_email);
    } else {
      setState(() {
        _errorMessage = 'Invalid email or password.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                HeaderText(
                  title: 'Welcome to Rasik',
                  subtitle: 'Discover and support authentic artisans',
                ),
                if (_errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(_errorMessage, style: const TextStyle(color: Colors.red)),
                  ),
                LoginInputField(
                  key: UniqueKey(),
                  label: 'Email',
                  hintText: 'Enter your email',
                  isPassword: false,
                  // Save email value
                  // Using onChanged or onSaved inside the widget is recommended
                  // Here assuming you modify the widget to accept onSaved or onChanged callbacks
                  onChanged: (val) => _email = val ?? '',
                ),
                LoginInputField(
                  key: UniqueKey(),
                  label: 'Password',
                  hintText: 'Enter your password',
                  isPassword: true,
                  onChanged: (val) => _password = val ?? '',
                ),
                PrimaryButton(
                  text: 'Log In',
                  onPressed: _submit,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Or continue with',
                  style: TextStyle(color: Color(0xFF897060)),
                ),
                const SizedBox(height: 12),
                const SocialLoginButtons(),
                TextButton(
                  onPressed: widget.onNavigateToSignup,
                  child: const Text('New User? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
