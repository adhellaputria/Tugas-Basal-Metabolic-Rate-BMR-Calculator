import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_app/components/custom_card.dart';
import 'package:bmi_app/components/icon_card.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/pages/result_page.dart';
import 'package:bmi_app/components/bottom_button.dart';
import 'package:bmi_app/components/round_icon_button.dart';
import 'package:bmi_app/calculator.dart';

// ============================================================================
// INPUT PAGE
// ----------------------------------------------------------------------------
// Halaman ini memungkinkan pengguna memasukkan data:
// - Gender
// - Tinggi badan (dengan slider)
// - Berat badan (dengan tombol + dan -)
// Setelah itu pengguna dapat menekan tombol CALCULATE untuk melihat hasil BMI.
// ============================================================================

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Nilai default
  Gender selectedGender = Gender.male;
  int height = 160;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ==================================================================
          // 1. PILIH JENIS KELAMIN
          // ==================================================================
          Expanded(
            child: Row(
              children: [
                // Card untuk male
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.male
                        ? activeCardColor // Jika dipilih
                        : inactiveCardColor, // Jika tidak dipilih
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.mars,
                      caption: 'MALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),

                // Card untuk female
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.venus,
                      caption: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // ==================================================================
          // 2. SLIDER UNTUK TINGGI BADAN
          // ==================================================================
          Expanded(
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: labelTextStyle),

                  // Menampilkan angka tinggi (contoh: 160 cm)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: numberTextStyle),
                      const Text('cm', style: labelTextStyle),
                    ],
                  ),

                  // Slider nilai tinggi
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double value) {
                      setState(() {
                        height = value.round(); // Update tinggi
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // ==================================================================
          // 3. TOMBOL UNTUK MENGATUR BERAT BADAN
          // ==================================================================
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: labelTextStyle),

                        // Menampilkan angka berat badan
                        Text(weight.toString(), style: numberTextStyle),

                        // Tombol tambah dan kurang berat badan
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight >= 30) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ==================================================================
          // 4. TOMBOL CALCULATE
          // ==================================================================
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              // Membuat instance class Calculator untuk menghitung BMI
              Calculator cal = Calculator(
                height: height,
                weight: weight,
                gender: selectedGender,
              );

              // Mengambil hasil dari class Calculator
              String bmi = cal.calculateBMI();
              String result = cal.getResult();
              String information = cal.getInterpretation();

              // Menavigasi ke halaman ResultPage sambil mengirim data hasil
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    result: result,
                    bmi: bmi,
                    information: information,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
