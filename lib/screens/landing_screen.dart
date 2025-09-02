import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'showroom_setup.dart';

class LandingScreen extends StatelessWidget {
  final bool Function(String email, String password) loginUser;
  final void Function(String email) onLogin;
  final VoidCallback onNavigateToSignup;

  const LandingScreen({
    super.key,
    required this.loginUser,
    required this.onLogin,
    required this.onNavigateToSignup,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    "Choose Your Path",
                    style: TextStyle(
                      color: Color(0xFF0C141C),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Kalakaar Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 201,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/xsjzl494EJ/ivl7imu6_expires_30_days.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "I am a Kalakaar",
                        style: TextStyle(
                          color: Color(0xFF0C141C),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Artisan - Innovator - Maker",
                        style: TextStyle(
                          color: Color(0xFF49729B),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ShowroomSetup(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF0C7FF2),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: const Text(
                              "Start Crafting",
                              style: TextStyle(
                                color: Color(0xFFF7F9FC),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Rasik Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 201,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/xsjzl494EJ/1b4sxs67_expires_30_days.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "I am a Rasik",
                        style: TextStyle(
                          color: Color(0xFF0C141C),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Connoisseur - Admirer - Supporter",
                        style: TextStyle(
                          color: Color(0xFF49729B),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                  loginUser: loginUser,
                                  onLogin: onLogin,
                                  onNavigateToSignup: onNavigateToSignup,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF0C7FF2),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: const Text(
                              "Start Discovering",
                              style: TextStyle(
                                color: Color(0xFFF7F9FC),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
