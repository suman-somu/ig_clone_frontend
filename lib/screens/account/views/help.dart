import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: HelpForm(), // Use a separate widget for the contact form
    );
  }
}

class HelpForm extends StatefulWidget {
  @override
  _HelpFormState createState() => _HelpFormState();
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

      // You can use a plugin to send emails or connect to a backend API
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
            title: Text('Query Submitted'),
            content: Text('Thank you for reaching out! We will respond to your query soon.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
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
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty || value == '') {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
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
              decoration: InputDecoration(labelText: 'Query'),
              validator: (value) {
                if (value == null || value.isEmpty || value == '') {
                  return 'Please enter your query';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void sendEmailToSupport(String name, String email, String query) {
  // Here you can integrate with an email sending library or an API
  // to send the email to your support email address.
  // Example: using a hypothetical email sending function
  // EmailPlugin.sendEmail(
  //   recipients: ['support@example.com'],
  //   subject: 'User Query from Instagram Clone',
  //   body: 'Name: $name\nEmail: $email\nQuery: $query',
  // );
  print('Email sent to support: \nName: $name\nEmail: $email\nQuery: $query');
}
