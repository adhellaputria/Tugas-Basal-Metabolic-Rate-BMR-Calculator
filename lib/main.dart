import 'package:flutter/material.dart';  // Mengimpor paket Material Design untuk membangun antarmuka pengguna
import 'package:bmi_app/pages/input_page.dart';  // Mengimpor halaman input_page untuk digunakan sebagai halaman utama

void main() {
  // Fungsi utama yang dijalankan saat aplikasi dimulai
  runApp(const MyApp());  // Menjalankan aplikasi dengan widget MyApp
}

// Kelas MyApp yang merupakan root widget aplikasi
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);  // Konstruktor untuk MyApp

  @override
  Widget build(BuildContext context) {
    // Membangun widget aplikasi dengan tema dan halaman utama
    return MaterialApp(
      theme: ThemeData.dark().copyWith(  // Menggunakan tema gelap dengan beberapa penyesuaian
        primaryColor: const Color(0xFF0A0E21),  // Warna utama untuk aplikasi
        scaffoldBackgroundColor: const Color(0xFF0A0E21),  // Warna latar belakang scaffold
        appBarTheme: const AppBarTheme(  // Pengaturan tema untuk AppBar
          backgroundColor: Color(0xFF0A0E21),  // Warna latar belakang AppBar
          centerTitle: true,  // Memusatkan judul pada AppBar
          elevation: 0.0,  // Menghapus bayangan pada AppBar
        ),
      ),
      home: InputPage(),  // Menetapkan InputPage sebagai halaman utama aplikasi
    );
  }
}
