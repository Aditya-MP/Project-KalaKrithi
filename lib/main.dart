import 'package:flutter/material.dart';
import 'screens/depth0_frame0_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, String> _registeredUsers = {};
  String? _currentUserEmail;

  void registerUser(String email, String password) {
    _registeredUsers[email] = password;
  }

  bool loginUser(String email, String password) {
    return _registeredUsers[email] == password;
  }

  void logout() {
    setState(() {
      _currentUserEmail = null;
    });
  }

  void _navigateToHome(String email) {
    setState(() {
      _currentUserEmail = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkrithi1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => _currentUserEmail == null
            ? LoginScreen(
          onLogin: (email) => _navigateToHome(email),
          onNavigateToSignup: () => Navigator.pushNamed(context, '/signup'),
          loginUser: loginUser,
        )
            : Depth0Frame0(onLogout: logout),
        '/signup': (context) => SignupScreen(
          onRegister: (email, password) {
            registerUser(email, password);
            Navigator.pop(context);
          },
        ),
      },
      initialRoute: '/',
    );
  }
}
