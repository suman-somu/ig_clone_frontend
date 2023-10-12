import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: const HelpForm(), // Use a separate widget for the contact form
    );
  }
}

class HelpForm extends StatefulWidget {
  const HelpForm({super.key});

  @override
  State<HelpForm> createState() => _HelpFormState();
}

class _HelpFormState extends State<HelpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _queryController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Send the email or perform any action you want
      String name = _nameController.text;
      String email = _emailController.text;
      String query = _queryController.text;

      // You can use a plugin to send emails or connect to a backend APHelpPageI
      // Send an email with the user's query to your support email address
      // Example using a hypothetical email sending function
      sendEmailToSupport(name, email, query);

      // Clear the form
      _nameController.clear();
      _emailController.clear();
      _queryController.clear();

      // Show a confirmation dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Query Submitted'),
            content: const Text('Thank you for reaching out! We will respond to your query soon.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty || value == '') {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty || value == '') {
                  return 'Please enter your email';
                }
                // You can add more email validation here
                return null;
              },
            ),
            TextFormField(
              controller: _queryController,
              maxLines: 5,
              decoration: const InputDecoration(labelText: 'Query'),
              validator: (value) {
                if (value == null || value.isEmpty || value == '') {
                  return 'Please enter your query';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void sendEmailToSupport(String name, String email, String query) {
  
}
