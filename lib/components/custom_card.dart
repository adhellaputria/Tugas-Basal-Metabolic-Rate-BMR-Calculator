import 'package:flutter/material.dart';  // Mengimpor paket Material Design untuk membangun antarmuka pengguna

// Widget CustomCard untuk menampilkan kartu yang dapat disesuaikan
class CustomCard extends StatelessWidget {
  // Konstruktor untuk menerima warna kartu, anak kartu, dan aksi saat kartu ditekan
  CustomCard({required this.color, this.cardChild, this.onPress});

  final Color color;  // Warna latar belakang kartu
  final Widget? cardChild;  // Widget anak yang akan ditampilkan di dalam kartu
  final Function()? onPress;  // Fungsi yang dijalankan saat kartu ditekan

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Menangani interaksi sentuhan dengan kartu
      onTap: onPress,  // Menjalankan aksi yang diteruskan ke parameter onPress
      child: Container(
        margin: const EdgeInsets.all(15.0),  // Memberikan jarak di sekitar kartu
        padding: const EdgeInsets.only(left: 1.0, right: 1.0),  // Padding di dalam kartu
        decoration: BoxDecoration(
          color: color,  // Menetapkan warna latar belakang kartu
          borderRadius: BorderRadius.circular(10.0),  // Membuat sudut kartu melengkung
        ),
        child: cardChild,  // Menampilkan anak kartu (misalnya, teks, ikon, atau elemen lain)
      ),
    );
  }
}
