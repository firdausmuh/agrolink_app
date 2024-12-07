import 'package:flutter/material.dart';

class LayananBox extends StatelessWidget {
  final String imagePath;
  final String label;
  const LayananBox({super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green, // Border color
              width: 2.0, // Border width
            ),
            borderRadius: BorderRadius.circular(16.0), // Rounded corners
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            height: 50.0,
            width: 100.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          textAlign: TextAlign
              .center, // To handle multiline text (e.g., "Perawatan Tanaman")
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
