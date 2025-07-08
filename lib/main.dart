import 'package:dateproject/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'sunflower',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 80,
            fontFamily: 'pari',
          ),

          displayMedium: TextStyle(
          color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.w700
          ),

          bodyMedium: TextStyle(
            fontSize: 25,
            color: Colors.white,

          ),

          bodySmall: TextStyle(
            fontSize: 20,
            color: Colors.white,
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}

