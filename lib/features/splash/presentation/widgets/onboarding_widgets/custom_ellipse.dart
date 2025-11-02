import 'package:flutter/material.dart';

class CustomEllipse extends StatelessWidget {
  const CustomEllipse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey,
      ),
    );
  }
}
