import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  void resetPassword() {
    print("Password reset link sent to ${emailController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter your email",
                prefixIcon: Icon(Icons.email),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: resetPassword,
              child: Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}
