import 'package:flutter/material.dart';  // Mengimpor paket Material Design untuk membangun antarmuka pengguna
import 'package:bmi_app/constants.dart';  // Mengimpor konstanta untuk gaya teks dan elemen lainnya

// Widget IconCard untuk menampilkan kartu dengan ikon dan teks
class IconCard extends StatelessWidget {
  // Konstruktor untuk menerima ikon dan caption (teks)
  IconCard({this.cardIcon, required this.caption});

  final IconData? cardIcon;  // Ikon yang akan ditampilkan dalam kartu
  final String caption;     // Teks yang akan ditampilkan di bawah ikon

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,  // Menyusun elemen di tengah kolom
      children: [
        // Menampilkan ikon dengan ukuran 70
        Icon(cardIcon, size: 70.0),
        const SizedBox(height: 15.0),  // Memberikan jarak vertikal antara ikon dan teks
        // Menampilkan caption (teks) dengan gaya labelTextStyle
        Text(caption, style: labelTextStyle),
      ],
    );
  }
}
