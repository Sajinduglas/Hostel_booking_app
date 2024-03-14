import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({super.key,
    required this.contentName,
    required this.controller,
    this.prefixIcon,
    this.validator,
    this.suffixIcon, this.labelText});

  final contentName;
  final controller;
  final prefixIcon;
  final validator;
  final suffixIcon;
  final labelText;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Color(0xFFd6e5ea),
          hintText: contentName,
          labelText: labelText,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
            // borderSide: BorderSide(color: Colors.black87)
          ),
        ),
        validator: validator,
      ),
    );
  }
}
