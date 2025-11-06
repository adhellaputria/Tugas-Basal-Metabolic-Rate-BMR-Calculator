import 'package:flutter/material.dart';  // Mengimpor paket Material Design untuk membangun antarmuka pengguna
import 'package:bmi_app/components/custom_card.dart';  // Mengimpor widget CustomCard untuk menampilkan kartu
import 'package:bmi_app/constants.dart';  // Mengimpor konstanta untuk warna dan gaya teks
import 'package:bmi_app/components/bottom_button.dart';  // Mengimpor widget BottomButton untuk tombol bawah

// Halaman ResultPage untuk menampilkan hasil perhitungan BMI
class ResultPage extends StatelessWidget {
  // Konstruktor untuk menerima hasil, BMI, dan informasi interpretasi
  const ResultPage({
    required this.result,  // Menyimpan hasil (Overweight, Normal, Underweight)
    required this.bmi,     // Menyimpan nilai BMI
    required this.information,  // Menyimpan interpretasi hasil
  });

  final String result;  // Hasil kategori BMI (Overweight, Normal, Underweight)
  final String bmi;     // Nilai BMI
  final String information;  // Interpretasi tentang BMI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR')),  // Judul halaman
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  // Menyebarkan widget secara merata
        crossAxisAlignment: CrossAxisAlignment.stretch,  // Menyebarkan widget ke seluruh lebar layar
        children: [
          // Judul 'Your Result'
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),  // Padding di sekitar teks
              alignment: Alignment.bottomLeft,  // Menyusun teks ke kiri bawah
              child: const Text(
                'Your Result',  // Teks yang ditampilkan sebagai judul
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),  // Gaya teks
              ),
            ),
          ),
          // Kartu untuk menampilkan hasil BMI
          Expanded(
            flex: 5,  // Menyediakan ruang lebih banyak untuk hasil
            child: CustomCard(
              color: activeCardColor,  // Menggunakan warna kartu aktif
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,  // Menyebarkan elemen secara merata
                crossAxisAlignment: CrossAxisAlignment.center,  // Menyusun elemen di tengah
                children: [
                  // Menampilkan hasil kategori BMI
                  Text(result, style: resultTextStyle),
                  // Menampilkan nilai BMI
                  Text(bmi, style: bmiTextStyle),
                  // Menampilkan informasi interpretasi BMI
                  Text(
                    information,
                    textAlign: TextAlign.center,  // Menyusun teks di tengah
                    style: const TextStyle(fontSize: 22.0),  // Gaya teks untuk interpretasi
                  ),
                ],
              ),
            ),
          ),
          // Tombol untuk kembali dan menghitung ulang
          BottomButton(
            buttonTitle: 'RE-CALCULATE',  // Teks tombol
            onTap: () {
              Navigator.pop(context);  // Kembali ke halaman sebelumnya untuk menghitung ulang
            },
          ),
        ],
      ),
    );
  }
}
