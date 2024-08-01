import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  static const String routeName = "History_Screen";
  final List<String> history;
  bool isLight ;
  HistoryScreen({Key? key,  required this.history , required this.isLight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: isLight ? Colors.black : Colors.white, // Set the back arrow color here
        ),
        elevation: 5.0,
        title: Center(child: Text('History', style: TextStyle(fontFamily: 'Armada' ,fontSize: 50, color: isLight ?  Color(0xff164555) : Color(0xff9DD9EE), ), ) ),
        backgroundColor: isLight ? Colors.white70 : Colors.black87,
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return Center(
            child: Column(
                children:[
                  Text(history[index] , style: TextStyle(fontFamily:'Consola' , fontSize: 25 ,color: isLight ? Colors.black : Colors.white ,fontWeight: FontWeight.bold),),
                  Divider(color:  isLight ?  Colors.indigo : Color(0xff6EACDA)  ,indent: 20 ,endIndent: 20 ,),
                ]
            ),
          );
        },
      ),
      backgroundColor: isLight ? Colors.white : Colors.black87,

    );
  }
}