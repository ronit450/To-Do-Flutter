// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  final String text;
  final Color button_color;
  final VoidCallback onPressed;
  const customButton({super.key, required this.text, required this.onPressed, required this.button_color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashFactory: InkRipple.splashFactory,
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          backgroundColor: MaterialStateProperty.all<Color>(button_color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ))),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }
}
