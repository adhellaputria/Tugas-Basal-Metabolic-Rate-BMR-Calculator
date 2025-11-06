import 'package:flutter/material.dart';  // Mengimpor paket Material Design untuk membangun antarmuka pengguna

// Widget RoundIconButton untuk menampilkan tombol berbentuk bulat dengan ikon di dalamnya
class RoundIconButton extends StatelessWidget {
  // Konstruktor menerima ikon dan fungsi yang dijalankan saat tombol ditekan
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;  // Ikon yang ditampilkan di dalam tombol
  final Function() onPressed;  // Fungsi yang dijalankan saat tombol ditekan

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,  // Menghapus efek bayangan pada tombol
      constraints: const BoxConstraints.tightFor(width: 40.0, height: 40.0),  // Menetapkan ukuran tombol tetap
      shape: const CircleBorder(),  // Membuat bentuk tombol menjadi lingkaran
      fillColor: const Color(0xFF4C4F5E),  // Menentukan warna latar tombol
      onPressed: onPressed,  // Menetapkan aksi yang dijalankan saat tombol ditekan
      child: Icon(icon),  // Menampilkan ikon di dalam tombol
    );
  }
}
