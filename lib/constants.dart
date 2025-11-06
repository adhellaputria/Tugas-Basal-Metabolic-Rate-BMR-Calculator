import 'package:flutter/material.dart';  // Mengimpor paket Material Design untuk membangun antarmuka pengguna

// Konstanta untuk warna kartu aktif dan tidak aktif
const activeCardColor = Color(0xFF1D1E33);  // Warna untuk kartu aktif
const inactiveCardColor = Color(0xFF111328);  // Warna untuk kartu tidak aktif

// Konstanta untuk tinggi dan warna bagian bawah kontainer
const bottomContainerHeight = 80.0;  // Tinggi bagian bawah kontainer
const bottomContainerColor = Color(0xFFEB1555);  // Warna bagian bawah kontainer

// Enum untuk jenis kelamin (pria atau wanita)
enum Gender { male, female }

// Konstanta untuk gaya teks berbagai elemen UI
const labelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));  // Gaya teks untuk label (misalnya, "Tinggi Badan")
const numberTextStyle = TextStyle(fontSize: 45.0, fontWeight: FontWeight.w900);  // Gaya teks untuk angka (misalnya, berat badan atau tinggi badan)
const buttonTextStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);  // Gaya teks untuk tombol
const resultTextStyle = TextStyle(
  color: Color(0xFF24D876),  // Warna teks hasil BMI (biasanya hijau untuk hasil normal)
  fontSize: 22,
  fontWeight: FontWeight.bold,
);
const bmiTextStyle = TextStyle(fontSize: 100, fontWeight: FontWeight.bold);  // Gaya teks untuk menampilkan nilai BMI
