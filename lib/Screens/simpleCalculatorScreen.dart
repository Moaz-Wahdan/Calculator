import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:second_app/Buttons/buttonStyle.dart';

class Simple_Calculator extends StatefulWidget {
  static const String routeName = "Calculator_Screen";

  Simple_Calculator({super.key});

  @override
  State<Simple_Calculator> createState() => _Simple_CalculatorState();
}

class _Simple_CalculatorState extends State<Simple_Calculator> {
  bool isLight = true;
  final TextEditingController _controller = TextEditingController();
  String result = '', expression = '';
  bool equalFlag = false;

  List<String> buttons = [
    'C', '(', ')', '/',
    '7', '8', '9', '*',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '.', 'ANS', '='
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
        backgroundColor: isLight ? Colors.white70 : Colors.black87,
        title: Text(
          'Calculator',
          style: TextStyle(
            color: isLight ?  Color(0xff164555) : Color(0xff9DD9EE),
            fontFamily: 'Armada',
            fontSize: 50,
          ),
        ),
        elevation: 5.0,
        actions: [
          AnimatedToggleSwitch<bool>.dual(
            current: isLight,
            first: true,
            second: false,
            spacing: 40.0,
            style: const ToggleStyle(
              backgroundColor: Color(0xff9DD9EE) ,
              borderColor: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1.5),
                ),
              ],
            ),
            borderWidth: 5.0,
            height: 40,
            onChanged: (b) {
              setState(() {
                isLight = b;
              });
            },
            styleBuilder: (b) => ToggleStyle(
              indicatorColor: b ? Colors.teal : Color(0xff03346E),
            ),
            iconBuilder: (value) => value
                ? Icon(Icons.light_mode, color: Colors.white)
                : Icon(Icons.dark_mode, color: Colors.white),
            textBuilder: (value) =>
            value ? Center(child: Text('Light' ,style: TextStyle(fontSize: 20 , color: Color(0xff164555) ),)) : Center(child: Text('Dark',style: TextStyle(fontSize: 20 , color: Color(
                0xff0a5a75)))),
          ),
        ],
      ),
      backgroundColor: isLight ? Colors.white : Colors.black87,
      body: Column(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 15, 0, 15),
                alignment: Alignment.centerLeft,
                child: TextField(
                  autofocus: true,
                  controller: _controller,
                  readOnly: true,
                  showCursor: true,
                  style: TextStyle(fontSize: 20.0, color:  isLight ? Colors.black : Colors.white ),
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
                padding: EdgeInsets.fromLTRB(0, 15, 20, 15),
                alignment: Alignment.centerRight,
                child: Text(
                  result,
                  style: TextStyle(  fontSize: 30  ,  color:  isLight ? Colors.black : Colors.white),
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.history),
                      color: isLight ?   Color(0xff03346E) : Color(0xff6EACDA),
                      iconSize: 35,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.swap_horizontal_circle),
                      color: isLight ?   Color(0xff03346E) : Color(0xff6EACDA),
                      iconSize: 35,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.science),
                      color: isLight ?   Color(0xff03346E) : Color(0xff6EACDA),
                      iconSize: 35,
                    ),
                  ],
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
                      color: isLight ?   Color(0xff03346E) : Color(0xff6EACDA),
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
                      color: isLight ?   Color(0xff03346E) : Color(0xff6EACDA),
                      iconSize: 35,
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
                      iconSize: 35,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Divider(color: Colors.indigo),
          SizedBox(height: 5),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (BuildContext context, int index) {
                /// Clear Button
                if (index == 0) {
                  return Button(
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
                    textButton: buttons[index],
                    colorText: Colors.white,
                    fontSize: 20,
                    colorButton: Color(0xff227D9B),
                    onClicked: () {
                      setState(() {
                        try {
                          result = evaluateMathExpression(expression).toString();
                          history.add(expression + ' = ' + result);
                          equalFlag = true;
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
                    textButton: buttons[index],
                    colorText: isLight ? Colors.black : Colors.white,
                    fontSize: 20,
                    colorButton:  isLight ? Color(0xff9DD9EE) : Color(0xff164555),
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
                    textButton: buttons[index],
                    colorText: isLight ? Colors.black : Colors.white,
                    fontSize: 20,
                    colorButton: isLight ? Color(0xff9DD9EE) : Color(0xff164555),
                    onClicked: () {
                      setState(() {
                        if (equalFlag) {
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
}

bool IsOperator(String buttonText) {
  return buttonText == '*' ||
      buttonText == '/' ||
      buttonText == '+' ||
      buttonText == '-' ||
      buttonText == '=' ||
      buttonText == '(' ||
      buttonText == ')';
}

double evaluateMathExpression(String expression) {
  Parser p = Parser();
  Expression exp = p.parse(expression);
  ContextModel cm = ContextModel();
  return exp.evaluate(EvaluationType.REAL, cm);
}
