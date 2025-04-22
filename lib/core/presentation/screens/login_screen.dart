import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/app_styles.dart';
import 'package:senior_project/core/widgets/social_buttons.dart';
import 'package:senior_project/core/widgets/custom_button.dart';
import 'package:awesome_dialog/awesome_dialog.dart'; // Import AwesomeDialog

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers for the text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Variables to hold error messages
  String emailError = '';
  String passwordError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login", style: AppStyles.loginSubtitle),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView( // Add SingleChildScrollView here to handle overflow
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("MIHNA", style: AppStyles.loginHeading),
            const Text("Login", style: AppStyles.loginSubtitle),
            const SizedBox(height: 160),

            // Email Field with label above the input field
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 5), // Space between label and input field
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter your Email",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
              ),
            ),
            // Show error message below the email input field if there's an error
            if (emailError.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  emailError,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            const SizedBox(height: 40),

            // Password Field with label above the input field
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Password",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 5), // Space between label and input field
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Enter your Password",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
              ),
            ),
            // Show error message below the password input field if there's an error
            if (passwordError.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  passwordError,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            const SizedBox(height: 40),

            // Forgot Password link
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password ?",
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ),
            ),

            // Login Button
            CustomButton(
              text: 'Login',
              onPressed: () async {
                setState(() {
                  emailError = '';
                  passwordError = '';
                });

                if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                  // If email or password is empty, show error
                  setState(() {
                    if (emailController.text.isEmpty) emailError = 'Please enter your email';
                    if (passwordController.text.isEmpty) passwordError = 'Please enter your password';
                  });
                  return;
                }

                try {
                  final credential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text);
                  Navigator.pushReplacementNamed(context, '/home');
                } on FirebaseAuthException catch (e) {
                  String errorMessage = '';

                  if (e.code == 'user-not-found') {
                    errorMessage = 'No user found for that email.';
                    setState(() {
                      emailError = errorMessage;
                    });
                  } else if (e.code == 'wrong-password') {
                    errorMessage = 'Incorrect password. Please try again.';
                    setState(() {
                      passwordError = errorMessage;
                    });
                  }
                }
              },
            ),

            const SizedBox(height: 35),

            // Sign-Up Option
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, '/signup'),
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: AppStyles.loginText,
                  children: [
                    TextSpan(
                      text: "Sign up",
                      style: AppStyles.loginTextBold,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // OR Divider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: 1,
                    endIndent: 10,
                  ),
                ),
                const Text("OR", style: AppStyles.orText),
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: 1,
                    indent: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // Social Sign-In Buttons (Google & Apple)
            const SocialButtons(),
          ],
        ),
      ),
    );
  }
}
