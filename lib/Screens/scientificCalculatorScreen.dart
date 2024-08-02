import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:second_app/Buttons/buttonStyle.dart';
import 'dart:math' as math;
import 'package:flutter_toggle_button/flutter_toggle_button.dart';

import 'package:second_app/Screens/history.dart';

class Scientific_Calculator extends StatefulWidget {
  static const String routeName = "Scientific_Calculator";
  bool isLight ;
   Scientific_Calculator({super.key , required this.isLight});

  @override
  State<Scientific_Calculator> createState() => _Scientific_CalculatorState();
}

class _Scientific_CalculatorState extends State<Scientific_Calculator> {

  final TextEditingController _controller = TextEditingController();
  String result = '', expression = '';
  bool equalFlag = false , isRad =true ;
  bool ansFlag = false;

  List<String> buttons = [
    'C' ,'sinh(' ,'cosh(' ,'asinh(' ,'acosh(' ,
    'e^' ,'sin(' ,'cos(' ,'asin(' ,'acos(' ,
    'ln(' ,'log_' ,'√(','∛(' , '^',
    '7' ,'8' ,'9' ,'(' ,')',
    '4' ,'5' ,'6' , '/' ,'*' ,
    '1' ,'2' ,'3'  ,'-' ,'+' ,
    '0' ,'.' ,'π' ,'ANS' ,'=' ,
  ];

  List<String> history = [];

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
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: widget.isLight ? Colors.black : Colors.white, // Set the back arrow color here
        ),
        backgroundColor: widget.isLight ? Colors.white70 : Colors.black87,
        title: Text(
          'Scientific  Calculator',
          style: TextStyle(
            color:  widget.isLight ?  Color(0xff164555) : Color(0xff9DD9EE),
            fontFamily: 'Armada',
            fontSize: 45,
          ),
        ),
        elevation: 5.0,

      ),
      backgroundColor:  widget.isLight ? Colors.white : Colors.black87,
      body: Column(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 9, 0, 9),
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
              Container(
                padding: EdgeInsets.fromLTRB(0, 9, 20, 9),
                alignment: Alignment.centerRight,
                child: Text(
                  result,
                  style: TextStyle(  fontSize: 20  ,  color:   widget.isLight ? Colors.black : Colors.white),
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryScreen(history: history ,isLight: widget.isLight,),
                      ),
                    );
                  },
                  icon: Icon(Icons.history),
                  color:  widget.isLight ?   Color(0xff03346E) : Color(0xff6EACDA),
                  iconSize: 33,
                ),
                FlutterToggleButton(
                  items: const ['R', 'D'],
                  onTap: (index) {
                    if (index == 0) {
                      isRad = true ;
                    }else{
                      isRad = false ;
                    }
                    print(isRad);
                  },
                  buttonWidth: 30,
                  buttonHeight: 30,
                  borderRadius: 25,
                  buttonTextFontSize: 38,
                  buttonColor: widget.isLight ?  Color(0xff9DD9EE) : Color(0xff164555),
                  enableTextColor: widget.isLight ?  Colors.black : Colors.white,
                  disableTextColor:  widget.isLight ?  Colors.black : Colors.white,
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
                      iconSize: 33,
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
                      iconSize: 33,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      int cursorPos = _controller.selection.baseOffset;
                      if (cursorPos > 0) {
                        expression = expression.substring(0, cursorPos - 1) +
                            expression.substring(cursorPos);
                        _controller.text = expression;
                        _controller.selection = TextSelection.fromPosition(
                          TextPosition(offset: cursorPos - 1),
                        );
                      }
                    });
                  },
                  icon: Icon(Icons.backspace),
                  color: Colors.red,
                  iconSize: 33,
                ),
              ],
            ),
          ),
          Divider(color:  widget.isLight ?  Colors.indigo : Color(0xff6EACDA) ,thickness: 2.5,),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
              itemBuilder: (BuildContext context, int index) {
                /// Clear Button
                if (index == 0) {
                  return Button(
                    raduis: 50,
                    textSize: 30,
                    textButton: buttons[index],
                    colorText: Colors.white,
                    fontSize: 30,
                    colorButton: Colors.redAccent,
                    onClicked: () {
                      setState(() {
                        result = '';
                        expression = '';
                        _controller.text = expression;
                      });
                    },
                  );
                }
                /// Equal Button
                else if (index == buttons.length - 1) {
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
                          result = (evaluateExpression(expression).toStringAsFixed(3));
                          history.add(expression + ' = ' + result);
                          equalFlag = true;
                          ansFlag = false ;
                        } catch (e) {
                          result = 'Error';
                        }
                      });
                    },
                  );
                }
                /// Ans Button
                else if (index == buttons.length - 2) {
                  return Button(
                    raduis: 50,
                    textSize: 30,
                    textButton: buttons[index],
                    colorText:  widget.isLight ? Colors.black : Colors.white,
                    fontSize: 20,
                    colorButton:   widget.isLight ? Color(0xff9DD9EE) : Color(0xff164555),
                    onClicked: () {
                      setState(() {
                        expression = '';
                        expression += result;
                        _updateControllerText(result);
                      });
                    },
                  );
                }
                /// Other Buttons
                else {
                  return Button(
                    raduis:  50,
                    textSize:  isFunction(buttons[index])? 17 : 30,
                    textButton: buttons[index],
                    colorText:  widget.isLight ? Colors.black : Colors.white,
                    fontSize: 20,
                    colorButton:  widget.isLight ? Color(0xff9DD9EE) : Color(0xff164555),
                    onClicked: () {
                      setState(() {
                        if (equalFlag== true && ansFlag == false) {
                          expression = '';
                          result = '';
                          _updateControllerText(expression);
                          equalFlag = false;
                        }
                        expression += buttons[index] ;
                        _updateControllerText(expression);
                      });
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  double evaluateMathExpression(String expression) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    return exp.evaluate(EvaluationType.REAL, cm);
  }
  double evaluateExpression(String userInput) {
    // Handle log_a(b) -> log(b) / log(a)
    userInput = userInput.replaceAllMapped(RegExp(r'log_(\d+(\.\d+)?)\((\d+(\.\d+)?)\)'), (match) {
      double a = double.parse(match.group(1)!);
      double b = double.parse(match.group(3)!);
      return '(ln($b) / ln($a))';
    });

    // Handle constants
    userInput = userInput.replaceAll('π', math.pi.toString());
    userInput = userInput.replaceAll('e', math.e.toString());

    // Trigonometric and hyperbolic functions
    userInput = userInput.replaceAllMapped(RegExp(r'sin\((\d+(\.\d+)?)\)'), (match) {
      double value = double.parse(match.group(1)!);
      double radians = isRad ? value : degreesToRadians(value);
      return '${math.sin(radians)}';
    });

    userInput = userInput.replaceAllMapped(RegExp(r'cos\((\d+(\.\d+)?)\)'), (match) {
      double value = double.parse(match.group(1)!);
      double radians = isRad ? value : degreesToRadians(value);
      return '${math.cos(radians)}';
    });

    userInput = userInput.replaceAllMapped(RegExp(r'asin\(([^)]+)\)'), (match) {
      double value = double.parse(match.group(1)!);
      double result = math.asin(value);

      return isRad ? '$result' : '${radiansToDegrees(result)}';
    });

    userInput = userInput.replaceAllMapped(RegExp(r'acos\(([^)]+)\)'), (match) {
      double value = double.parse(match.group(1)!);
      double result = math.acos(value);
      return isRad ? '$result' : '${radiansToDegrees(result)}';
    });

    userInput = userInput.replaceAllMapped(RegExp(r'sinh\((\d+(\.\d+)?)\)'), (match) {
      double value = double.parse(match.group(1)!);
      return '${sinh(value)}';
    });

    userInput = userInput.replaceAllMapped(RegExp(r'cosh\((\d+(\.\d+)?)\)'), (match) {
      double value = double.parse(match.group(1)!);
      return '${cosh(value)}';
    });

    userInput = userInput.replaceAllMapped(RegExp(r'asinh\((\d+(\.\d+)?)\)'), (match) {
      double value = double.parse(match.group(1)!);
      print('CCCCCCCCCCCCCCCCCCCCCCCCCC');

      return '${asinh(value)}';
    });

    userInput = userInput.replaceAllMapped(RegExp(r'acosh\((\d+(\.\d+)?)\)'), (match) {
      double value = double.parse(match.group(1)!);
      return '${acosh(value)}';
    });

    userInput = userInput.replaceAllMapped(RegExp(r'√\((\d+(\.\d+)?)\)'), (match) {
      double value = double.parse(match.group(1)!);
      return '${math.sqrt(value)}';
    });

    userInput = userInput.replaceAllMapped(RegExp(r'∛\((\d+(\.\d+)?)\)'), (match) {
      double value = double.parse(match.group(1)!);
      return '${math.pow(value, 1/3)}';
    });

    // Evaluate the final expression
    return evaluateMathExpression(userInput);
  }

}

double degreesToRadians(double degrees) {
  return degrees * (math.pi / 180);
}
double radiansToDegrees(double radian) {
  return radian * (180 / math.pi );
}
double manualAsin(double x, {int terms = 10}) {
  if (x < -1 || x > 1) {
    throw ArgumentError('The input value must be in the range [-1, 1]');
  }
  double result = x;
  double term = x;
  for (int n = 1; n < terms; n++) {
    term *= (x * x * (2 * n - 1) * (2 * n - 1)) / ((2 * n) * (2 * n + 1));
    result += term;
  }
  return result;
}
double manualAcos(double x, {int terms = 10}) {
  return math.pi / 2 - manualAsin(x, terms: terms);
}

double sinh(double x) {
  return ( (math.exp(x)) - (math.exp(-x)) ) / 2;
}

// Hyperbolic cosine
double cosh(double x) {
  return (math.exp(x) + math.exp(-x)) / 2;
}

double asinh(double x) {
  return math.log(x + math.sqrt((x * x) + 1));
}

double acosh(double x) {
  return math.log( x + math.sqrt((x * x) - 1));
}
bool isFunction(String text){
  if(
  text == 'sin(' || text == 'cos(' || text == 'asin(' || text == 'acos(' ||
      text == 'sinh(' || text == 'cosh(' || text == 'asinh(' || text == 'acosh(' || text == 'log_'
  ){
    return true ;
  }else{
    return false ;
  }
}
