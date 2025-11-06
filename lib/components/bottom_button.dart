import 'package:flutter/material.dart';  // Mengimpor paket Material Design untuk membangun antarmuka pengguna
import 'package:bmi_app/constants.dart';  // Mengimpor konstanta untuk warna dan gaya teks

// Widget BottomButton untuk menampilkan tombol di bagian bawah layar
class BottomButton extends StatelessWidget {
  // Konstruktor untuk menerima judul tombol dan aksi saat tombol ditekan
  BottomButton({required this.buttonTitle, required this.onTap});

  final String buttonTitle;  // Judul teks yang ditampilkan pada tombol
  final Function() onTap;    // Fungsi yang dijalankan saat tombol ditekan

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Menangani interaksi sentuhan dengan tombol
      onTap: onTap,  // Menjalankan aksi yang diteruskan ke parameter onTap
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),  // Memberikan jarak atas pada tombol
        height: bottomContainerHeight,  // Menentukan tinggi tombol
        color: bottomContainerColor,  // Menetapkan warna latar belakang tombol
        child: Center(child: Text(buttonTitle, style: buttonTextStyle)),  // Menampilkan teks tombol di tengah
      ),
    );
  }
}
