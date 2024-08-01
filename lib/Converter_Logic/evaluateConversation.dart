import 'package:flutter/material.dart';
import 'package:second_app/Buttons/buttonStyle.dart';

class Unit extends StatefulWidget {
  static const String routeName = "Calculator_Screen";
  bool isLight ;
  String unit_name   ;
  List<String> units ;
   Unit({super.key, required this.isLight , required this.unit_name , required this.units});

  @override
  State<Unit> createState() => _Unit();
}

class _Unit extends State<Unit> {
  final TextEditingController _controller = TextEditingController();
  String toValue = '', fromValue = '' ;
  String selected1 = 'Select Unit' , selected2 = 'Select Unit';
  String temp = '';
  List<String> buttons = [
    '6','7', '8', '9',
    '2', '3','4', '5',
    '0', '.', '1',  '='
  ];

  void _updateControllerText(String text) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _controller.text = text;
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 20,),
                  Text('From' , style: TextStyle(fontSize: 25,fontFamily: 'Consola' ,color: widget.isLight ? Colors.black : Colors.white),),
                 SizedBox(width: 20,),
                 DropdownButton<String>(
                    value: selected1,
                    icon: Icon(Icons.arrow_drop_down_circle_outlined ,  color:  widget.isLight ?   Color(0xff03346E) : Color(0xff6EACDA),),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color:  widget.isLight ?   Color(0xff03346E) : Color(0xff6EACDA)),
                    underline: Container(
                    height: 2,
                    color: widget.isLight ?   Color(0xff03346E) : Color(0xff6EACDA),
                    ),
                    onChanged: (String? newValue) {
                    setState(() {
                    selected1 = newValue! ;
                    });
                    },
                    items: widget.units.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: TextStyle(fontSize: 20,fontFamily: 'Consola')),
                    );
                    }).toList(),
                    ),
    ],
    ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 15, 0, 15),
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    cursorColor:  widget.isLight ? Colors.black : Colors.white ,
                    autofocus: true,
                    controller: _controller,
                    readOnly: true,
                    showCursor: true,
                    style: TextStyle(fontSize: 20.0, color:   widget.isLight ? Colors.black : Colors.white ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    onTap: () {
                      _controller.selection = TextSelection.fromPosition(
                        TextPosition(offset: _controller.text.length),
                      );
            
                    },
                  ),
                ),
                SizedBox(height: 5),
                Divider(color:  widget.isLight ?  Colors.indigo : Color(0xff6EACDA), indent: 20 , endIndent: 20, thickness: 3,),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Text('To' , style: TextStyle(fontSize: 25,fontFamily: 'Consola' ,color: widget.isLight ? Colors.black : Colors.white),),
                    SizedBox(width: 50,),
                    DropdownButton<String>(
                      value: selected2,
                      icon: Icon(Icons.arrow_drop_down_circle_outlined ,color: widget.isLight ?   Color(0xff03346E) : Color(0xff6EACDA),),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color:widget.isLight ?   Color(0xff03346E) : Color(0xff6EACDA)),
                      underline: Container(
                        height: 2,
                        color: widget.isLight ?   Color(0xff03346E) : Color(0xff6EACDA),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selected2 = newValue! ;
                        });
                      },
                      items: widget.units.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: TextStyle(fontSize: 20,fontFamily: 'Consola')),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15, 20, 15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    toValue,
                    style: TextStyle(  fontSize: 30  ,  color:   widget.isLight ? Colors.black : Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: (){
                      setState(() {
                        temp = selected1 ;
                        selected1 = selected2 ;
                        selected2 = temp ;
                      });
                    },
                    icon: Icon(Icons.swap_vert , size: 40,),
                    color:  widget.isLight ?   Color(0xff03346E) : Color(0xff6EACDA),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          int cursorPos = _controller.selection.baseOffset;
                          if (cursorPos > 0) {
                            _controller.selection = TextSelection.fromPosition(
                              TextPosition(offset: cursorPos - 1),
                            );
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color:  widget.isLight ?   Color(0xff03346E) : Color(0xff6EACDA),
                      iconSize: 35,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          int cursorPos = _controller.selection.baseOffset;
                          if (cursorPos < _controller.text.length) {
                            _controller.selection = TextSelection.fromPosition(
                              TextPosition(offset: cursorPos + 1),
                            );
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                      color:  widget.isLight ?   Color(0xff03346E) : Color(0xff6EACDA),
                      iconSize: 35,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      int cursorPos = _controller.selection.baseOffset;
                      if (cursorPos > 0) {
                        fromValue = fromValue.substring(0, cursorPos - 1) +
                            fromValue.substring(cursorPos);
                        _controller.text = fromValue;
                        _controller.selection = TextSelection.fromPosition(
                          TextPosition(offset: cursorPos - 1),
                        );
                      }
                    });
                  },
                  icon: Icon(Icons.backspace),
                  color: Colors.red,
                  iconSize: 35,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Divider(color:  widget.isLight ?  Colors.indigo : Color(0xff6EACDA)),
          SizedBox(height: 5),
          Expanded(
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (BuildContext context, int index) {
                /// Equal Button
                 if (index == buttons.length - 1) {
                  return Button(
                    raduis: 50,
                    textSize: 30,
                    textButton: buttons[index],
                    colorText: Colors.white,
                    fontSize: 20,
                    colorButton: Color(0xff227D9B),
                    onClicked: () {
                      setState(() {
                        try {
                          toValue = evaluateConversion( widget.unit_name, selected1 , selected2 ,fromValue);
                        } catch (e) {
                          toValue = 'Error';
                        }
                      });
                    },
                  );
                }
                /// Other Buttons
                else {
                  return Button(
                    raduis: 50,
                    textSize: 30,
                    textButton: buttons[index],
                    colorText:  widget.isLight ? Colors.black : Colors.white,
                    fontSize: 20,
                    colorButton:  widget.isLight ? Color(0xff9DD9EE) : Color(0xff164555),
                    onClicked: () {
                      setState(() {
                        fromValue += buttons[index] ;
                        _updateControllerText(fromValue);
                      });
                    },
                  );
                }
              },
            ),
          ),
        ],
      )
    ;
  }
}


String evaluateConversion( String unitName, String from, String to, String value) {
  print(from);
  print(to);

  if (from == 'Select Unit' || to == 'Select Unit') {
    return 'Select units';
  }else if (   (from == to)   ) {
    return 'Select different units';
  }else if (value == ''){
    return 'Enter Value';
  } else{
    double inputValue = double.parse(value);
    double resultValue = 0.0;

    // Define conversion factors for different units
    Map<String, Map<String, double>> conversionFactors = {
      'Area': {
        'Square Meters': 1.0,
        'Square Kilometers': 1e-6,
        'Acres': 0.000247105,
        'Square Miles': 3.861e-7,
        'Hectares': 1e-4,
        'Square Feet': 10.7639,
        'Square Yards': 1.19599,
      },
      'Length': {
        'Millimeters': 1.0,
        'Centimeters': 0.1,
        'Meters': 0.001,
        'Kilometers': 1e-6,
        'Inches': 0.0393701,
        'Feet': 0.00328084,
        'Yards': 0.00109361,
        'Miles': 6.2137e-7,
        'Nautical Miles': 5.3996e-7,
      },
      'Temperature': {},
      'Volume': {
        'Liters': 1.0,
        'Milliliters': 1000.0,
        'Cubic Meters': 0.001,
        'Cubic Feet': 0.0353147,
        'Gallons': 0.264172,
        'Pints': 2.11338,
        'Cups': 4.16667,
        'Fluid Ounces': 33.814,
      },
      'Mass': {
        'Kilograms': 1.0,
        'Grams': 1000.0,
        'Pounds': 2.20462,
        'Ounces': 35.274,
        'Tons': 0.00110231,
        'Stones': 0.157473,
      },
      'Data': {
        'Bits': 1.0,
        'Bytes': 0.125,
        'Kilobytes': 0.00012207,
        'Megabytes': 1.19209e-7,
        'Gigabytes': 1.16415e-10,
        'Terabytes': 1.13687e-13,
        'Petabytes': 1.11022e-16,
      },
      'Speed': {
        'Meters per second': 1.0,
        'Kilometers per hour': 3.6,
        'Miles per hour': 2.23694,
        'Knots': 1.94384,
        'Feet per second': 3.28084,
      },
      'Time': {
        'Seconds': 1.0,
        'Minutes': 1 / 60,
        'Hours': 1 / 3600,
        'Days': 1 / 86400,
        'Weeks': 1 / 604800,
        'Months': 1 / 2.628e+6,
        'Years': 1 / 3.154e+7,
      },
    };

    if (unitName == 'Temperature') {
      // Handle temperature separately due to different formulas
      if (from == 'Celsius' && to == 'Fahrenheit') {
        resultValue = (inputValue * 9 / 5) + 32;
      } else if (from == 'Fahrenheit' && to == 'Celsius') {
        resultValue = (inputValue - 32) * 5 / 9;
      } else if (from == 'Celsius' && to == 'Kelvin') {
        resultValue = inputValue + 273.15;
      } else if (from == 'Kelvin' && to == 'Celsius') {
        resultValue = inputValue - 273.15;
      } else if (from == 'Fahrenheit' && to == 'Kelvin') {
        resultValue = (inputValue - 32) * 5 / 9 + 273.15;
      } else if (from == 'Kelvin' && to == 'Fahrenheit') {
        resultValue = (inputValue - 273.15) * 9 / 5 + 32;
      }
    } else {
      // General conversion using conversion factors
      double fromFactor = conversionFactors[unitName]?[from] ?? 1.0;
      double toFactor = conversionFactors[unitName]?[to] ?? 1.0;
      resultValue = inputValue / fromFactor * toFactor;
    }

    return resultValue.toString();
  }
}

