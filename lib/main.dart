import 'package:flutter/material.dart';
import 'package:second_app/Screens/simpleCalculatorScreen.dart';

void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

  home: Simple_Calculator(),

      debugShowCheckedModeBanner: false,
    );
  }
}

