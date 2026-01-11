import 'package:flutter/material.dart';
// Mengimpor pustaka Material untuk menggunakan widget dan warna standar Flutter

// ============================================================================
// KONSTANTA WARNA KARTU & UI
// ============================================================================

// Warna kartu yang sedang aktif (misalnya kartu gender yang dipilih)
const activeCardColor = Color(0xFF1D1E33);

// Warna kartu yang tidak aktif (gender tidak dipilih)
const inactiveCardColor = Color(0xFF111328);

// Tinggi container bagian bawah (tombol Calculate)
const bottomContainerHeight = 80.0;

// Warna container bagian bawah (tombol Calculate)
const bottomContainerColor = Color(0xFFEB1555);

// ============================================================================
// ENUM UNTUK MEMILIH JENIS KELAMIN
// ============================================================================
// Enum Gender digunakan untuk menentukan pilihan "male" atau "female".
// Enum sangat berguna karena meningkatkan keamanan tipe data dan
// mencegah salah input string.
enum Gender { male, female }

// ============================================================================
// KONSTANTA GAYA TEKS (TEXT STYLE)
// ============================================================================

// Gaya teks untuk label kecil, seperti label "HEIGHT", "WEIGHT", "AGE"
const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98), // Abu-abu agak terang
);

// Gaya teks untuk angka besar (misalnya nilai tinggi, berat, dan umur)
const numberTextStyle = TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.w900, // Bold ekstra tebal
);

// Gaya teks untuk tombol besar "CALCULATE" atau tombol konfirmasi
const buttonTextStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

// Gaya teks untuk hasil kategori BMI (normal/overweight/underweight)
const resultTextStyle = TextStyle(
  color: Color(0xFF24D876), // Hijau stabil
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

// Gaya teks untuk nilai BMI besar yang ditampilkan pada halaman hasil
const bmiTextStyle = TextStyle(fontSize: 100, fontWeight: FontWeight.bold);
