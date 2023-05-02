import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final _nameController = TextEditingController();
// await FlutterEmailSender.send(email);

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future sendEmail(String name, String email, String message) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceId = 'service_jdrxhfm';
    const templateId = 'template_hiqapcq';
    const userId = '1P35DgJ0o-5Eu-knI';

    final response = await http.post(url,
        headers: {
          // 'origin': 'http://localhost',
          'Content-Type': 'application/json'
        }, //This line makes sure it works for all platforms.
        body: jsonEncode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'from_name': name,
            'from_email': email,
            'message': message
          }
        }));
    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Contact Me'),
      ),
      body: Container(
        color: Color.fromARGB(255, 56, 55, 55),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  enableSuggestions: true,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: _nameController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.roboto(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    labelText: 'Enter Your Full Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.roboto(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value!)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  enableSuggestions: true,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: _messageController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.roboto(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    labelText: 'Message',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Send email with form data
                      // _formKey.currentState?.reset();

                      final response = await sendEmail(
                          _nameController.value.text,
                          _emailController.value.text,
                          _messageController.value.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        response == 200
                            ? const SnackBar(
                                content: Text('Message Sent!'),
                                backgroundColor: Colors.green)
                            : SnackBar(
                                content:
                                    Text('Failed to send message!$response'),
                                backgroundColor: Colors.red),
                      );
                    }
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      color: Color.fromARGB(255, 67, 66, 66),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
