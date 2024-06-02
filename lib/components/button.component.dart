import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function() onPress;
  final String text;

  const Button({super.key, required this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(onPressed: onPress, child: Text(text)),
    );
  }
}
