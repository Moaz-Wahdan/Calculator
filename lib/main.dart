import 'package:flutter/material.dart';
import 'package:second_app/Screens/converterScreen.dart';
import 'package:second_app/Screens/history.dart';
import 'package:second_app/Screens/simpleCalculatorScreen.dart';
import 'package:second_app/Screens/splashScreen.dart';

void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Calculator App',
      initialRoute: SplashScreen.routeName,
      routes: {
        Simple_Calculator.routeName : (buildContext) => Simple_Calculator(),
        SplashScreen.routeName : (buildContext)=>SplashScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/UnitConverter') {
          final bool isLight = settings.arguments as bool ;
          return MaterialPageRoute(
            builder: (context) => UnitConverter(isLight: isLight),
          );
        }
        if (settings.name == '/Scientific_Calculator') {
          final bool isLight = settings.arguments as bool ;
          return MaterialPageRoute(
            builder: (context) => UnitConverter(isLight: isLight),
          );
        }
        if (settings.name == '/history') {
          final List<String> history = settings.arguments as List<String>;
          final bool isLight = settings.arguments as bool ;
          return MaterialPageRoute(
            builder: (context) => HistoryScreen(history: history ,isLight: isLight,),
          );
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

