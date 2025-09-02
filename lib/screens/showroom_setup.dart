import 'package:flutter/material.dart';

class ShowroomSetup extends StatefulWidget {
  const ShowroomSetup({super.key});

  @override
  State<ShowroomSetup> createState() => _ShowroomSetupState();
}

class _ShowroomSetupState extends State<ShowroomSetup> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _businessController = TextEditingController();
  final TextEditingController _storyController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Showroom registration submitted!')),
      );

      _nameController.clear();
      _businessController.clear();
      _storyController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Showroom Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  filled: true,
                  fillColor: Color(0xFFF4F2EF),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _businessController,
                decoration: const InputDecoration(
                  labelText: 'Business Details (Optional)',
                  filled: true,
                  fillColor: Color(0xFFF4F2EF),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _storyController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: "Artist's Story",
                  filled: true,
                  fillColor: Color(0xFFF4F2EF),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your artist story';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  backgroundColor: const Color(0xFFED772B),
                ),
                child: const Text('Submit Registration'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
