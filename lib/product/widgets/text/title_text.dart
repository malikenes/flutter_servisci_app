import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({required this.value, super.key});
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
