import 'package:flutter/material.dart';

// ============================================================================
// ROUND ICON BUTTON
// ----------------------------------------------------------------------------
// Widget tombol berbentuk bulat dengan ikon di dalamnya.
// Dipakai untuk tombol + dan - pada pengaturan berat badan.
// Menggunakan RawMaterialButton agar bentuk dan ukuran bisa dikustom.
// ============================================================================

class RoundIconButton extends StatelessWidget {
  // Konstruktor menerima ikon dan fungsi onPressed
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon; // Ikon yang akan tampil di dalam tombol
  final Function() onPressed; // Fungsi yang dipanggil saat tombol ditekan

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0, // Menghilangkan bayangan
      constraints: const BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ), // Ukuran tombol bulat
      shape: const CircleBorder(), // Bentuk tombol = lingkaran
      fillColor: const Color(0xFF4C4F5E), // Warna latar tombol
      onPressed: onPressed, // Aksi saat tombol ditekan
      child: Icon(icon), // Ikon di tengah tombol
    );
  }
}
