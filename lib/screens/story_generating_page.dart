import 'package:flutter/material.dart';

class StoryGeneratingPage extends StatefulWidget {
  const StoryGeneratingPage({super.key});

  @override
  State<StoryGeneratingPage> createState() => _StoryGeneratingPageState();
}

class _StoryGeneratingPageState extends State<StoryGeneratingPage> {
  bool isRecording = false;

  void toggleRecording() {
    setState(() {
      isRecording = !isRecording;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Replace with your actual wave image asset (or keep this free one)
    const waveImageUrl =
        'https://storage.googleapis.com/tagjs-prod.appspot.com/v1/9BCNdnhUVz/1abfdkv5_expires_30_days.png';

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  "Listening...",
                  style: TextStyle(
                    color: Color(0xFF0C141C),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              // Audio Wave Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    waveImageUrl,
                    height: 180,
                    width: 320,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                        height: 180,
                        width: 320,
                        color: const Color(0xFFEEEFF2),
                        alignment: Alignment.center,
                        child: const Icon(Icons.error_outline,
                            color: Colors.red, size: 48)),
                  ),
                ),
              ),
              const SizedBox(height: 26),
              // Start/Stop Recording Button
              Center(
                child: ElevatedButton(
                  onPressed: toggleRecording,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    isRecording ? const Color(0xFFE8EDF4) : const Color(0xFFE8EDF4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 36, vertical: 14),
                    elevation: 0,
                  ),
                  child: Text(
                    isRecording ? "Stop Recording" : "Start Recording",
                    style: TextStyle(
                      color: isRecording
                          ? const Color(0xFF0C141C)
                          : const Color(0xFF0C141C),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 34),
              // Send Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your send logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3D99F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Send",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Cancel Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE8EDF4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF0C141C)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
