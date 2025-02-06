import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Controller untuk nama, email, password, dan tanggal lahir
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  // Fungsi untuk memilih tanggal lahir
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = _dateFormat.format(picked);
      });
    }
  }

  // Fungsi Sign Up menggunakan Firebase Authentication
  Future<void> signUp() async {
    try {
      // Menggunakan Firebase untuk membuat akun baru dengan email dan password
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print("User signed up: ${userCredential.user!.email}");

      // Menampilkan dialog berhasil
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Success"),
          content: Text("Sign up successful!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } catch (e) {
      // Menampilkan pesan error jika gagal
      print("Error: $e");
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'image/signup_image.png',
                          height: 150,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already registered? ",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  // Menambahkan controller untuk inputan
                  buildTextField(Icons.person, "Name",
                      controller: _nameController),
                  SizedBox(height: 15),
                  buildTextField(Icons.email, "Email",
                      controller: _emailController),
                  SizedBox(height: 15),
                  buildTextField(Icons.lock, "Password",
                      obscureText: true, controller: _passwordController),
                  SizedBox(height: 15),
                  TextField(
                    controller: _dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Date of Birth",
                      prefixIcon:
                          Icon(Icons.calendar_today, color: Colors.redAccent),
                      suffixIcon:
                          Icon(Icons.arrow_forward, color: Colors.redAccent),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: () => _selectDate(context),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: signUp, // Memanggil fungsi signUp
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat input field dengan controller
  Widget buildTextField(IconData icon, String hint,
      {bool obscureText = false, TextEditingController? controller}) {
    return TextField(
      controller: controller, // Menggunakan controller
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.redAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
