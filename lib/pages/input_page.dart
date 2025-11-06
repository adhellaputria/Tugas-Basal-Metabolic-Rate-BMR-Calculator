import 'package:flutter/material.dart';  // Mengimpor paket Material Design untuk membangun antarmuka pengguna
import 'package:font_awesome_flutter/font_awesome_flutter.dart';  // Mengimpor ikon dari FontAwesome
import 'package:bmi_app/components/custom_card.dart';  // Mengimpor widget CustomCard
import 'package:bmi_app/components/icon_card.dart';  // Mengimpor widget IconCard
import 'package:bmi_app/constants.dart';  // Mengimpor konstanta seperti warna dan gaya teks
import 'package:bmi_app/pages/result_page.dart';  // Mengimpor halaman ResultPage untuk menampilkan hasil BMI
import 'package:bmi_app/components/bottom_button.dart';  // Mengimpor widget BottomButton
import 'package:bmi_app/components/round_icon_button.dart';  // Mengimpor widget RoundIconButton
import 'package:bmi_app/calculator.dart';  // Mengimpor kalkulator untuk menghitung BMI

// Halaman InputPage dengan input tinggi badan, berat badan, dan jenis kelamin
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;  // Menyimpan pilihan jenis kelamin, defaultnya pria
  int height = 160;  // Menyimpan tinggi badan, defaultnya 160 cm
  int weight = 60;   // Menyimpan berat badan, defaultnya 60 kg

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR')),  // Judul aplikasi
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,  // Memastikan kolom mengambil ruang penuh
        children: [
          // Pemilihan jenis kelamin
          Expanded(
            child: Row(
              children: [
                // Kartu untuk memilih jenis kelamin laki-laki
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.male
                        ? activeCardColor  // Jika jenis kelamin pria terpilih, kartu aktif
                        : inactiveCardColor,  // Jika tidak, kartu tidak aktif
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.mars,  // Ikon untuk laki-laki
                      caption: 'MALE',  // Teks untuk laki-laki
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;  // Setel jenis kelamin ke pria saat kartu ditekan
                      });
                    },
                  ),
                ),
                // Kartu untuk memilih jenis kelamin perempuan
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.female
                        ? activeCardColor  // Jika jenis kelamin wanita terpilih, kartu aktif
                        : inactiveCardColor,  // Jika tidak, kartu tidak aktif
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.venus,  // Ikon untuk wanita
                      caption: 'FEMALE',  // Teks untuk wanita
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;  // Setel jenis kelamin ke wanita saat kartu ditekan
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          // Pemilih tinggi badan menggunakan slider
          Expanded(
            child: CustomCard(
              color: activeCardColor,  // Warna kartu aktif
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: labelTextStyle),  // Label tinggi badan
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: numberTextStyle),  // Menampilkan tinggi badan
                      const Text('cm', style: labelTextStyle),  // Satuan cm
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),  // Menampilkan nilai slider
                    min: 120.0,  // Nilai minimum slider
                    max: 220.0,  // Nilai maksimum slider
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();  // Mengupdate nilai tinggi badan saat slider digeser
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          // Pemilih berat badan menggunakan tombol minus dan plus
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,  // Warna kartu aktif
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: labelTextStyle),  // Label berat badan
                        Text(weight.toString(), style: numberTextStyle),  // Menampilkan berat badan
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Tombol minus untuk mengurangi berat badan
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight >= 30) {
                                    weight--;  // Mengurangi berat badan jika lebih dari 30 kg
                                  }
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),  // Jarak antara tombol
                            // Tombol plus untuk menambah berat badan
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;  // Menambah berat badan
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
          // Tombol untuk menghitung BMI
          BottomButton(
            buttonTitle: 'CALCULATE',  // Judul tombol
            onTap: () {
              // Membuat objek Calculator untuk menghitung BMI
              Calculator cal = Calculator(
                height: height,
                weight: weight,
                gender: selectedGender,
              );
              // Menghitung nilai BMI, hasil, dan interpretasi
              String bmi = cal.calculateBMI();
              String result = cal.getResult();
              String information = cal.getInterpretation();
              // Arahkan ke halaman ResultPage dengan membawa hasil perhitungan
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
