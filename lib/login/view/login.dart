import 'package:expense_tracker/auth/auth_service.dart';
import 'package:expense_tracker/home_page/view/home_page.dart';
import 'package:expense_tracker/sign_up/view/sign_up.dart';
import 'package:flutter/material.dart';

import '../../utils/assets_path.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      await authService.signInWithPassword(email, password);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error:$e")));
      }
    }
  }

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
                  SizedBox(height: 25),
                  CustomButton(
                    text: "Login",
                    onTap: () async {
                      final email = emailController.text.trim();
                      final password = passwordController.text;
                      if (email.isEmpty || password.isEmpty) {
                        _showMessage("Please enter all fields");
                        return;
                      }
                      final result = await authService.signInWithPassword(email, password);
                      _showMessage(result);
                      if (result.toLowerCase().contains("success")) {
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        });
                      }
                    },
                  ),
                  SizedBox(height: 250),
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
        const Text("Don't have an account?"),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUp()),
            );
          },
          child: const Text(
            "Sign Up",
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
