import 'package:flutter/material.dart';
import 'package:bmi_app/components/custom_card.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/components/bottom_button.dart';

// ============================================================================
// RESULT PAGE
// ----------------------------------------------------------------------------
// Halaman ini menampilkan hasil perhitungan BMI yang sudah dihitung
// di class Calculator. Page ini menerima tiga data:
// - result       → kategori BMI (overweight/normal/underweight)
// - bmi          → nilai BMI
// - information  → interpretasi sesuai hasil BMI
// ============================================================================

class ResultPage extends StatelessWidget {
  const ResultPage({
    required this.result,
    required this.bmi,
    required this.information,
  });

  final String result; // Kategori BMI
  final String bmi; // Nilai BMI sebagai string
  final String information; // Kalimat penjelasan BMI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Judul "Your Result"
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Kartu utama berisi hasil BMI
          Expanded(
            flex: 5,
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Kategori (NORMAL / OVERWEIGHT / UNDERWEIGHT)
                  Text(result, style: resultTextStyle),

                  // Nilai BMI
                  Text(bmi, style: bmiTextStyle),

                  // Penjelasan tambahan
                  Text(
                    information,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 22.0),
                  ),
                ],
              ),
            ),
          ),

          // Tombol untuk kembali ke halaman input
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context); // Kembali ke input
            },
          ),
        ],
      ),
    );
  }
}
