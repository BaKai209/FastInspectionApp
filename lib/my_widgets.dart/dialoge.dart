import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class MyDialoge extends StatelessWidget {
  MyDialoge({super.key, required this.path});
  final TextEditingController emailController = TextEditingController();
  final String path;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text('Share via Email'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  label: const Text('Email'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                if (emailController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please enter email to continue')));
                } else {
                  try {
                    final Email email = Email(
                      subject: 'Fast Inspection',
                      recipients: [emailController.text],
                      attachmentPaths: [path],
                      isHTML: false,
                    );

                    await FlutterEmailSender.send(email);
                    print('email sent');
                  } catch (e) {
                    print('error while sending email $e');
                  }
                }
              },
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(90, 40),
                ),
              ),
              child: const Text(
                'Send',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}
