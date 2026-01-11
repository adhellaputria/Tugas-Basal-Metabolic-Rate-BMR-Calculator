import 'package:flutter/material.dart';
import 'package:bmi_app/constants.dart';

// ============================================================================
// ICON CARD
// ----------------------------------------------------------------------------
// Widget sederhana untuk menampilkan ikon besar dan teks di bawahnya.
// Digunakan untuk card pilihan gender (MALE / FEMALE).
// ============================================================================

class IconCard extends StatelessWidget {
  // Konstruktor, cardIcon boleh null, caption wajib
  IconCard({this.cardIcon, required this.caption});

  final IconData?
  cardIcon; // Ikon yang akan ditampilkan (contoh: FontAwesomeIcons.mars)
  final String caption; // Teks label di bawah ikon

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Ikon besar di tengah kartu
        Icon(cardIcon, size: 70.0),

        const SizedBox(height: 15.0),

        // Caption menggunakan style standar dari constants.dart
        Text(caption, style: labelTextStyle),
      ],
    );
  }
}
