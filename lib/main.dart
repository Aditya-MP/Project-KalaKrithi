import 'package:flutter/material.dart';
import 'screens/landing_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/showroom_setup.dart';
import 'screens/depth0_frame0_screen.dart'; // Home screen after login

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

  void _navigateToSignup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SignupScreen(
          onRegister: (email, password) {
            registerUser(email, password);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkrithi1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Builder(builder: (context) {
        if (_currentUserEmail == null) {
          return LandingScreen(
            loginUser: loginUser,
            onLogin: _navigateToHome,
            onNavigateToSignup: () => _navigateToSignup(context),
          );
        } else {
          return Depth0Frame0(
            onLogout: logout,
          );
        }
      }),
      routes: {
        '/showroom': (context) => const ShowroomSetup(),
      },
    );
  }
}
