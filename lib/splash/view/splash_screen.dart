import 'package:flutter/material.dart';

import '../../auth/auth_gate.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets_path.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthGate()),
      );
    }
    );
    return Container(
      color: AppColors.splashBackground,
      child: Center(
          child: Image.asset(AssetsPath.appLogo, height: 275, width: 275)),
    );
  }
}
