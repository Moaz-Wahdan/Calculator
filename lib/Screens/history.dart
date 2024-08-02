import 'package:flutter/material.dart';
import 'package:second_app/Screens/scientificCalculatorScreen.dart';
import 'package:second_app/Screens/simpleCalculatorScreen.dart';

class HistoryScreen extends StatefulWidget {
  static const String routeName = "History_Screen";
  final List<String> history;
  bool isLight ;
  String fromScreen ;
  HistoryScreen({Key? key,  required this.history , required this.isLight , required this.fromScreen}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: widget.isLight ? Colors.black : Colors.white, // Set the back arrow color here
        ),
        elevation: 5.0,
        title: Center(child: Text('History', style: TextStyle(fontFamily: 'Armada' ,fontSize: 50, color: widget.isLight ?  Color(0xff164555) : Color(0xff9DD9EE), ), ) ),
        backgroundColor: widget.isLight ? Colors.white70 : Colors.black87,
      ),
      body: ListView.builder(
        itemCount: widget.history.length,
        itemBuilder: (context, index) {
          return Center(
            child: Column(
                children:[
                  InkWell(
                      onTap: (){
                        if( widget.history[index] != '' ){
                          setState(() {
                            result = (widget.history[index]).substring(((widget.history[index]).indexOf('='))+1);
                            if(widget.fromScreen == 'Scientific'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Scientific_Calculator(isLight: widget.isLight , oldValue: result,),
                                ),
                              );
                            }
                            else if(widget.fromScreen == 'Simple'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Simple_Calculator( oldValue: result,),
                                ),
                              );
                            }
                          });
                        }
                      },
                      child: Text(widget.history[index] , style: TextStyle(fontFamily:'Consola' , fontSize: 25 ,color: widget.isLight ? Colors.black : Colors.white ,fontWeight: FontWeight.bold),)),
                  Divider(color:  widget.isLight ?  Colors.indigo : Color(0xff6EACDA)  ,indent: 20 ,endIndent: 20 ,),
                ]
            ),
          );
        },
      ),
      backgroundColor: widget.isLight ? Colors.white : Colors.black87,

    );
  }
}