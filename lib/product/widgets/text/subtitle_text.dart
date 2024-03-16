// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({
    required this.value,
    required this.color,
    super.key,
  });
  final String value;

  final Color color;

  @override
  Widget build(BuildContext context) {
    // ignore: lines_longer_than_80_chars
    return Text(
      value,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: color),
    );
  }
}
