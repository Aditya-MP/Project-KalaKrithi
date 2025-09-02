import 'package:flutter/material.dart';

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

  Widget _buildInputField(String hint, bool obscureText, Function(String?) onSaved) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.05), blurRadius: 6)],
      ),
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
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(244, 242, 239, 1),
          foregroundColor: Colors.black87,
          padding: const EdgeInsets.symmetric(vertical: 14),
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: Column(
            children: [
              const Text(
                'Welcome to Rasik',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                'Discover and support authentic artisans',
                style: TextStyle(fontSize: 16, color: Color(0xFF888888)),
              ),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(_errorMessage, style: const TextStyle(color: Colors.red)),
                ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildInputField('Email', false, (val) => _email = val ?? ''),
                    _buildInputField('Password', true, (val) => _password = val ?? ''),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                      child: ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFED772B),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Log In', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
              const Text('Or continue with', style: TextStyle(color: Color(0xFF897060))),
              _socialButton('Google', () => debugPrint('Google Login')),
              _socialButton('Facebook', () => debugPrint('Facebook Login')),
              TextButton(
                onPressed: widget.onNavigateToSignup,
                child: const Text('New User? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
