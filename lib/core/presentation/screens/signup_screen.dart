import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/app_styles.dart';
import 'package:senior_project/core/widgets/social_buttons.dart';
import 'package:senior_project/core/widgets/custom_button.dart';
import 'package:awesome_dialog/awesome_dialog.dart';  // Import AwesomeDialog

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  String emailError = '';
  String passwordError = '';
  String usernameError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up", style: AppStyles.signUpSubtitle),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("MIHNA", style: AppStyles.signUpHeading),
            const Text("Sign Up", style: AppStyles.signUpSubtitle),
            const SizedBox(height: 35),

            // Name Field with error handling
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Name",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: username,
              decoration: InputDecoration(
                hintText: "Enter your Name",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
              ),
            ),
            if (usernameError.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  usernameError,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            const SizedBox(height: 40),

            // Email Field with error handling
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
            const SizedBox(height: 5),
            TextFormField(
              controller: email,
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
            if (emailError.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  emailError,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            const SizedBox(height: 40),

            // Password Field with error handling
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
            const SizedBox(height: 5),
            TextFormField(
              controller: password,
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
            if (passwordError.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  passwordError,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            const SizedBox(height: 40),

            // Sign-Up Button
            CustomButton(
              text: 'Sign Up',
              onPressed: () async {
                setState(() {
                  emailError = '';
                  passwordError = '';
                  usernameError = '';
                });

                if (email.text.isEmpty || password.text.isEmpty || username.text.isEmpty) {
                  setState(() {
                    if (email.text.isEmpty) emailError = 'Please enter your email';
                    if (password.text.isEmpty) passwordError = 'Please enter your password';
                    if (username.text.isEmpty) usernameError = 'Please enter your name';
                  });
                  return;
                }

                try {
                  // Firebase sign-up process
                  final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );

                  // Update the user's displayName with the entered username
                  await userCredential.user!.updateDisplayName(username.text);

                  // Send email verification
                  await userCredential.user!.sendEmailVerification();

                  // Show Awesome Dialog for email verification
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.info,
                    animType: AnimType.rightSlide,
                    title: 'Email Verification',
                    desc: 'A verification email has been sent to your inbox. Please check your email and follow the instructions to complete your registration.',
                    btnOkOnPress: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ).show();
                  
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),

            const SizedBox(height: 35),

            // Log-in Option
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, '/login'),
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: AppStyles.loginText,
                  children: [
                    TextSpan(
                      text: "Log in",
                      style: AppStyles.loginTextBold,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
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

            // ✅ Social Sign-In Buttons (Google & Apple)
            const SocialButtons(),
          ],
        ),
      ),
    );
  }
}