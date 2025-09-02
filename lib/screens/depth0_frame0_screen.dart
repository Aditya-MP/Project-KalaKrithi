import 'package:flutter/material.dart';

class Depth0Frame0 extends StatefulWidget {
  final VoidCallback? onLogout;

  const Depth0Frame0({super.key, this.onLogout});

  @override
  Depth0Frame0State createState() => Depth0Frame0State();
}

class Depth0Frame0State extends State<Depth0Frame0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Craftly"),
        actions: [
          if (widget.onLogout != null)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: widget.onLogout,
              tooltip: 'Logout',
            )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 16, bottom: 40),
          child: Column(
            children: [
              const Text(
                "Choose Your Path",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              _buildCard(
                imageUrl:
                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/xsjzl494EJ/ivl7imu6_expires_30_days.png",
                title: "I am a Kalakaar",
                subtitle: "Artisan - Innovator - Maker",
                buttonText: "Start Crafting",
                onPressed: () => debugPrint("Start Crafting"),
              ),

              _buildCard(
                imageUrl:
                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/xsjzl494EJ/1b4sxs67_expires_30_days.png",
                title: "I am a Rasik",
                subtitle: "Connoisseur - Admirer - Supporter",
                buttonText: "Start Discovering",
                onPressed: () => debugPrint("Start Discovering"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String imageUrl,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.05), blurRadius: 8)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              title,
              style:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                foregroundColor: Colors.blue,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}
