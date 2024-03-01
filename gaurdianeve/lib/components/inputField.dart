import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final bool obscureText;
  final TextEditingController? controller;
  final String? hintText;
  const InputField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200
          )
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          )
        ),
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[100],
        hintStyle: const TextStyle(
          color: Colors.grey

        )


      ),
    );


    
  }
}