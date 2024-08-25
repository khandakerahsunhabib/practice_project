import 'package:flutter/material.dart';
import 'package:practice_project/home.dart';

void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(),
    );
  }
}
