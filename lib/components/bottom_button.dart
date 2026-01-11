import 'package:flutter/material.dart';
import 'package:bmi_app/constants.dart';

// ============================================================================
// BOTTOM BUTTON
// ----------------------------------------------------------------------------
// Widget tombol besar yang digunakan sebagai tombol utama aplikasi,
// seperti tombol "CALCULATE" dan "RE-CALCULATE". Tombol ini menempel
// di bagian bawah layar (full width) dan memiliki gaya konsisten.
// ============================================================================

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonTitle, required this.onTap});

  final String buttonTitle; // Teks yang tampil di tombol
  final Function() onTap; // Fungsi yang dijalankan saat tombol ditekan

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Menangani aksi tekan tombol
      child: Container(
        margin: const EdgeInsets.only(top: 10.0), // Spasi atas tombol
        height: bottomContainerHeight, // Tinggi tombol dari constants.dart
        color: bottomContainerColor, // Warna tombol dari constants.dart
        child: Center(
          child: Text(
            buttonTitle, // Teks tombol
            style: buttonTextStyle, // Gaya tulisan dari constants.dart
          ),
        ),
      ),
    );
  }
}
