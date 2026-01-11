import 'package:flutter/material.dart';  
import 'package:bmi_app/pages/input_page.dart';  

// ===================================================================
// FUNGSI UTAMA APLIKASI
// ===================================================================
// Fungsi main() adalah titik awal eksekusi program Flutter.
// Ketika aplikasi dijalankan, Flutter akan memanggil fungsi main()
// dan menampilkan widget awal yang ditentukan di dalam runApp().
void main() {
  runApp(const MyApp());  // Menjalankan aplikasi dengan widget akar MyApp
}

// ===================================================================
// ROOT WIDGET APLIKASI
// ===================================================================
// MyApp adalah widget paling atas (root) dalam struktur widget tree.
// Widget ini menentukan tema aplikasi dan halaman apa yang pertama
// kali ditampilkan ketika aplikasi dibuka.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // -------------------------------------------------------------------
  // METHOD BUILD
  // -------------------------------------------------------------------
  // Method build akan dipanggil setiap kali Flutter perlu menggambar
  // ulang UI. Di sini kita mengembalikan MaterialApp sebagai struktur
  // dasar aplikasi yang menggunakan Material Design.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // =================================================================
      // TEMA APLIKASI
      // =================================================================
      // ThemeData.dark() digunakan sebagai tema dasar (dark mode),
      // kemudian dilakukan copyWith() untuk mengganti warna tertentu
      // sesuai desain aplikasi.
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),           // Warna utama aplikasi
        scaffoldBackgroundColor: const Color(0xFF0A0E21), // Warna background utama
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),  // Warna AppBar
          centerTitle: true,                   // Judul AppBar berada di tengah
          elevation: 0.0,                      // Tanpa bayangan AppBar
        ),
      ),

      // =================================================================
      // HALAMAN UTAMA APLIKASI
      // =================================================================
      // home: InputPage()
      //
      // Berarti saat aplikasi dijalankan, halaman pertama yang muncul
      // adalah InputPage(), yaitu halaman tempat pengguna memasukkan:
      // - jenis kelamin (male / female)
      // - tinggi badan (cm)
      // - berat badan (kg)
      //
      // Dari halaman inilah alur perhitungan BMR/BMI dimulai.
      home: InputPage(),
    );
  }
}
