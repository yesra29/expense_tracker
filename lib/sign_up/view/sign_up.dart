import 'package:expense_tracker/login/view/login.dart';
import 'package:expense_tracker/utils/assets_path.dart';
import 'package:flutter/material.dart';

import '../../auth/auth_service.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final authService = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: Container(
                decoration: BoxDecoration(color: Color(0xFF4CAF50)),
                child: Center(
                  child: Image(image: AssetImage(AssetsPath.loginBG)),
                ),
              ),
            ),
            Positioned(
              top: 300,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  CustomTextField(
                    hintText: "Enter your email",
                    prefixIcon: Icons.mail_outline,
                    controller: emailController,
                    isPassword: false,
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    hintText: "Enter your password",
                    prefixIcon: Icons.password_outlined,
                    controller: passwordController,
                    isPassword: true,
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    hintText: "Confirm your password",
                    prefixIcon: Icons.password_outlined,
                    controller: confirmPasswordController,
                    isPassword: true,
                  ),
                  SizedBox(height: 25),
                  CustomButton(
                    text: "Sign Up",
                    onTap: () async {
                      final email = emailController.text.trim();
                      final password = passwordController.text;
                      final confirmPassword = confirmPasswordController.text;
                      if (email.isEmpty ||
                          password.isEmpty ||
                          confirmPassword.isEmpty) {
                        _showMessage("Please enter all fields");
                        return;
                      }
                      if (password != confirmPassword) {
                        _showMessage("Password do not match.");
                        return;
                      }

                      final result = await authService.signUp(email, password);
                      _showMessage(result);
                      if (result.startsWith("Sign-up successful")) {
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        });
                      }
                    },
                  ),
                  SizedBox(height: 170),
                  _bottomText(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomText() {
    return Column(
      children: [
        const Text("Already have an account?"),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: const Text(
            "Login",
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
