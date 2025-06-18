import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextStyle? hintTextStyle;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.hintTextStyle,
    required this.prefixIcon,
    required this.controller,
    required this.isPassword,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscureText;
  @override
  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle:
            widget.hintTextStyle ??
            const TextStyle(color: Colors.black, fontSize: 16.0),
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                )
                : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
