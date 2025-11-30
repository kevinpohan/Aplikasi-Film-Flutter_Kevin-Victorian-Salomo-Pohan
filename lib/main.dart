import 'package:flutter/material.dart';
import 'movie_page.dart'; // Pastikan file ini diimpor

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Film TVMaze',
      debugShowCheckedModeBanner: false, // Menghilangkan label "Debug" di pojok
      // --- UI/UX Theme Setup ---
      theme: ThemeData(
        // Menggunakan ColorScheme modern (Material 3)
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,

        // Styling AppBar agar konsisten di seluruh aplikasi
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        // Styling Input/TextField agar terlihat rapi
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),

      // Halaman awal aplikasi
      home: const MoviePage(),
    );
  }
}
