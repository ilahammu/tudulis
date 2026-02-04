import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label; // Tulisannya apa?
  final VoidCallback onPressed; // Pas ditekan ngapain?
  final Color warna; // Warnanya apa? (Opsional)

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.warna = Colors.blueAccent, // Default warna biru
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: warna,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Melengkung cantik
        ),
        elevation: 5, // Ada bayangannya
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
