import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  const CustomButton({
    super.key,
    required this.text,
    this.textStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style:
                textStyle ?? const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
