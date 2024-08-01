import 'package:flutter/material.dart';
import 'package:second_app/Screens/simpleCalculatorScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "Splash_Screen";
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Future.delayed(
        Duration(seconds: 3 ),
            (){
          Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => Simple_Calculator() ) );
        }

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child : Image(image: AssetImage("assets/images/splash_screen.png") ,fit: BoxFit.fill, width: double.infinity, height: double.infinity)
          ),
        ],
      ),
      backgroundColor: Colors.transparent ,
    ) ;
  }
}
