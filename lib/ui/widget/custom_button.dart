import 'package:flutter/material.dart';
import 'package:medica/const/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;

  final String data;

  const CustomButton({super.key, required this.onPressed, required this.data});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) =>
              (states.contains(MaterialState.pressed) ? primary : color1))),
      child: Text(
        data,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
