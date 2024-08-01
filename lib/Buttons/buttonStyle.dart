import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String textButton;
  final Color colorButton;
  final Color colorText;
  final double fontSize;
  final VoidCallback onClicked;

  Button({
    required this.textButton,
    required this.colorText,
    required this.fontSize,
    required this.colorButton,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius:4,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            color: colorButton,
          ),
          child: Center(
            child: Text(
              textButton,
              style: TextStyle(
                fontSize: 30 ,
                fontFamily: 'Consola',
                color: colorText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
