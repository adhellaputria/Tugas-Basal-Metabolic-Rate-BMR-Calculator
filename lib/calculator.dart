import 'dart:math';
// Mengimpor library matematika untuk memakai fungsi pow()

import 'constants.dart';
// Mengimpor file constants.dart untuk menggunakan enum Gender

// ============================================================================
// CLASS CALCULATOR
// ============================================================================
// Class ini bertanggung jawab untuk menghitung nilai BMI menggunakan
// data tinggi badan, berat badan, dan gender (walaupun gender tidak memengaruhi BMI,
// tapi tetap disertakan agar struktur data konsisten dengan form InputPage).
// ============================================================================

class Calculator {
  // Konstruktor menerima tinggi, berat, dan gender sebagai input.
  // Ketiganya wajib (required).
  Calculator({
    required this.height,
    required this.weight,
    required this.gender,
  });

  // Variabel data input
  final int height; // Tinggi badan dalam cm
  final int weight; // Berat badan dalam kg
  final Gender gender; // Jenis kelamin dari enum Gender

  // Variabel internal untuk menyimpan nilai BMI
  double _bmi = 0.0;

  // ==========================================================================
  // METHOD: calculateBMI()
  // --------------------------------------------------------------------------
  // Menghitung nilai BMI menggunakan rumus:
  //
  //    BMI = berat (kg) / (tinggi(m)²)
  //
  // Tinggi awal dalam cm dikonversi ke meter dengan membagi 100.
  //
  // Setelah dihitung, _bmi disimpan dan dikembalikan dalam format
  // 1 angka di belakang koma.
  // ==========================================================================
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2); // Rumus BMI
    return _bmi.toStringAsFixed(1); // Format 1 angka desimal
  }

  // ==========================================================================
  // METHOD: getResult()
  // --------------------------------------------------------------------------
  // Mengembalikan kategori BMI berdasarkan nilai _bmi:
  //
  //  - Overweight : BMI ≥ 25
  //  - Normal     : 18.5 ≤ BMI < 25
  //  - Underweight: BMI < 18.5
  //
  // Kategori ini yang nanti ditampilkan pada halaman hasil.
  // ==========================================================================
  String getResult() {
    if (_bmi >= 25) return 'Overweight';
    if (_bmi >= 18.5) return 'Normal';
    return 'Underweight';
  }

  // ==========================================================================
  // METHOD: getInterpretation()
  // --------------------------------------------------------------------------
  // Memberikan kalimat interpretasi/penjelasan sesuai kategori BMI:
  //
  //  - Overweight : sarankan olahraga
  //  - Normal     : puji berat badan ideal
  //  - Underweight: sarankan menambah asupan makanan
  //
  // Ini akan ditampilkan di halaman hasil sebagai deskripsi tambahan.
  // ==========================================================================
  String getInterpretation() {
    if (_bmi >= 25)
      return 'You have a higher than normal body weight. Try to exercise more.';
    if (_bmi >= 18.5) return 'You have a normal body weight. Good job!';
    return 'You have a lower than normal body weight. You can eat a bit more.';
  }
}
