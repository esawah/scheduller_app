import 'package:flutter/material.dart';
import 'forgot_password_page.dart';
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFFFA6C61),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'image/login_image.png',
                          width: 250,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon:
                            Icon(Icons.email_outlined, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon:
                            Icon(Icons.lock_outline, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFA6C61),
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      print("Login clicked");
                    },
                    child: Icon(Icons.arrow_forward,
                        color: Colors.white, size: 28),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don’t have an account? ",
                              style: TextStyle(color: Colors.black)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
