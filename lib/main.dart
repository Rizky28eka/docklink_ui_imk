import 'package:flutter/material.dart';
import 'package:slicing_docklink_ui_imk/page/auth/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const OnBoarding(),
    );
  }
}