// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';


class CustomInput extends StatelessWidget {
  final onPressed;

  final String text;
  const CustomInput({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.9,
        margin: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 18,
            ),
          ),
        ),
      ),
    );
  }
}