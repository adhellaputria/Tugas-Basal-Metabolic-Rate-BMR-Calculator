import 'package:flutter/material.dart';

// ============================================================================
// CUSTOM CARD
// ----------------------------------------------------------------------------
// Widget reusable yang digunakan untuk membungkus konten seperti card gender,
// slider tinggi badan, dan card berat badan. Widget ini fleksibel karena bisa
// menampung child dan memiliki fungsi onTap opsional.
// ============================================================================

class CustomCard extends StatelessWidget {
  // Konstruktor menerima:
  // - color      → warna background kartu
  // - cardChild  → isi widget di dalam kartu
  // - onPress    → fungsi yang dijalankan saat kartu ditekan (optional)
  CustomCard({required this.color, this.cardChild, this.onPress});

  final Color color; // Warna background kartu
  final Widget? cardChild; // Isi widget di dalam kartu
  final Function()? onPress; // Aksi ketika kartu disentuh (boleh null)

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress, // Memungkinkan kartu bereaksi pada sentuhan
      child: Container(
        margin: const EdgeInsets.all(15.0), // Margin sekeliling kartu
        padding: const EdgeInsets.only(left: 1, right: 1), // Padding minimal
        decoration: BoxDecoration(
          color: color, // Warna kartu
          borderRadius: BorderRadius.circular(10.0), // Sudut melengkung
        ),
        child: cardChild, // Konten kartu
      ),
    );
  }
}
