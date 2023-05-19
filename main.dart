import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ebapp_insta_profile/constants.dart';
import 'package:ebapp_insta_profile/app_spacings.dart';
import 'main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '@eb.app Instragram Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      home: const MainScreen(),
    );
  }
}
