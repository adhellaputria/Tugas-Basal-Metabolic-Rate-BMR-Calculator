import 'dart:math';  // Mengimpor library untuk operasi matematika
import 'constants.dart';  // Mengimpor file constants.dart yang berisi definisi Gender atau konstanta lainnya

// Kelas Calculator untuk menghitung dan menginterpretasikan BMI
class Calculator {
  // Konstruktor untuk menerima input tinggi badan, berat badan, dan jenis kelamin
  Calculator({
    required this.height,  // Tinggi badan dalam cm
    required this.weight,  // Berat badan dalam kg
    required this.gender,  // Jenis kelamin (misalnya: laki-laki atau perempuan)
  });

  final int height;  // Variabel tinggi badan
  final int weight;  // Variabel berat badan
  final Gender gender;  // Variabel jenis kelamin

  double _bmi = 0.0;  // Variabel private untuk menyimpan hasil BMI

  // Fungsi untuk menghitung BMI berdasarkan rumus BMI = berat / (tinggi^2)
  String calculateBMI() {
    // Menghitung BMI dengan rumus yang benar (tinggi dalam cm diubah menjadi meter)
    _bmi = weight / pow(height / 100, 2);
    // Mengembalikan hasil BMI dalam format satu angka desimal
    return _bmi.toStringAsFixed(1);
  }

  // Fungsi untuk menentukan kategori BMI
  String getResult() {
    // Jika BMI lebih dari atau sama dengan 25, kategori kelebihan berat badan
    if (_bmi >= 25) return 'Overweight';
    // Jika BMI lebih dari atau sama dengan 18.5 dan kurang dari 25, kategori berat badan normal
    if (_bmi >= 18.5) return 'Normal';
    // Jika BMI kurang dari 18.5, kategori kekurangan berat badan
    return 'Underweight';
  }

  // Fungsi untuk memberikan interpretasi berdasarkan kategori BMI
  String getInterpretation() {
    // Jika BMI lebih dari atau sama dengan 25, beri saran untuk berolahraga lebih banyak
    if (_bmi >= 25)
      return 'You have a higher than normal body weight. Try to exercise more.';
    // Jika BMI lebih dari atau sama dengan 18.5 dan kurang dari 25, beri pujian atas berat badan normal
    if (_bmi >= 18.5) return 'You have a normal body weight. Good job!';
    // Jika BMI kurang dari 18.5, beri saran untuk makan lebih banyak
    return 'You have a lower than normal body weight. You can eat a bit more.';
  }
}
