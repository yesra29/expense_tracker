import 'package:expense_tracker/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final authService =AuthService();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  void login() async {
    final email=emailController.text;
    final password=passwordController.text;
    
    try{
      await authService.signInWithPassword(email, password);
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
