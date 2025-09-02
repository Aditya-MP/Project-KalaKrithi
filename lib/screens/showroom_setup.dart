import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class ShowroomSetup extends StatefulWidget {
  const ShowroomSetup({super.key});

  @override
  State<ShowroomSetup> createState() => _ShowroomSetupState();
}

class _ShowroomSetupState extends State<ShowroomSetup> {
  XFile? _profileImage;
  String _artistName = '';
  String _artistStory = '';
  String _businessName = '';
  String _businessEmail = '';
  String _businessPhone = '';

  final _nameController = TextEditingController();
  final _storyController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickProfileImage() async {
    final pickedImage =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedImage != null) {
      setState(() {
        _profileImage = pickedImage;
      });
    }
  }

  void _handleVoiceInput() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Voice assistant feature coming soon!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle =
    const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0C0F1C));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: const Text(
          'Showroom Setup',
          style: TextStyle(
              color: Color(0xFF0C0F1C), fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),

              // Editable profile image
              GestureDetector(
                onTap: _pickProfileImage,
                child: CircleAvatar(
                  radius: 56,
                  backgroundColor: const Color(0xFFE5E8F4),
                  backgroundImage: _profileImage != null
                      ? Image.file(
                    File(_profileImage!.path),
                    fit: BoxFit.cover,
                  ).image
                      : const NetworkImage(
                    'https://storage.googleapis.com/tagjs-prod.appspot.com/v1/BSML5JvnyV/bwaij4n0_expires_30_days.png',
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Artist name input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: "Enter your name",
                    filled: true,
                    fillColor: Color(0xFFE5E8F4),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide.none),
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0C0F1C)),
                  onChanged: (val) => setState(() => _artistName = val),
                ),
              ),
              const SizedBox(height: 4),

              // Username display
              if (_artistName.isNotEmpty)
                Text(
                  '@' + _artistName.trim().toLowerCase().replaceAll(' ', ''),
                  style: const TextStyle(
                    color: Color(0xFF47569E),
                    fontSize: 16,
                  ),
                ),

              const SizedBox(height: 24),

              // Artist's Story label and input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 6),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Artist's Story", style: labelStyle),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Stack(
                  children: [
                    TextField(
                      controller: _storyController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: "Tell us about your artistic journey...",
                        filled: true,
                        fillColor: Color(0xFFE5E8F4),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide.none),
                      ),
                      onChanged: (val) => setState(() => _artistStory = val),
                    ),
                    Positioned(
                      bottom: 14,
                      right: 14,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: _handleVoiceInput,
                          borderRadius: BorderRadius.circular(24),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(Icons.mic, color: Colors.white, size: 22),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Business Details label
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 6),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Business Details (Optional)", style: labelStyle),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    _buildBusinessField(
                      hint: "Business Name",
                      value: _businessName,
                      onChanged: (val) => setState(() => _businessName = val),
                    ),
                    const SizedBox(height: 12),
                    _buildBusinessField(
                      hint: "Business Email",
                      value: _businessEmail,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) => setState(() => _businessEmail = val),
                    ),
                    const SizedBox(height: 12),
                    _buildBusinessField(
                      hint: "Business Phone",
                      value: _businessPhone,
                      keyboardType: TextInputType.phone,
                      onChanged: (val) => setState(() => _businessPhone = val),
                    ),
                  ],
                ),
              ),

              // Action Buttons row
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 28, 18, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // You can add validation and submit logic here
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Details submitted!')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              )),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          "Done",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Upload your art feature coming soon!')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              )),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          "Upload Your Art",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBusinessField({
    required String hint,
    required String value,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFE5E8F4),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      ),
      onChanged: onChanged,
    );
  }
}
