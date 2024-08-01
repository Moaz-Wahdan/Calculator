import 'package:flutter/material.dart';
import 'package:second_app/Converter_Logic/evaluateConversation.dart';

class UnitConverter extends StatefulWidget {
  bool isLight ;
  UnitConverter({super.key , required this.isLight});
  static const String routeName = "Unit_Converter_Screen";
  List<String> areaUnits = [
    'Select Unit',
    'Square Meters',
    'Square Kilometers',
    'Acres',
    'Square Miles',
    'Hectares',
    'Square Feet',
    'Square Yards'
  ];

  List<String> lengthUnits = [
    'Select Unit',
    'Millimeters',
    'Centimeters',
    'Meters',
    'Kilometers',
    'Inches',
    'Feet',
    'Yards',
    'Miles',
    'Nautical Miles'
  ];

  List<String> temperatureUnits = [
    'Select Unit',
    'Celsius',
    'Fahrenheit',
    'Kelvin'
  ];

  List<String> volumeUnits = [
    'Select Unit',
    'Liters',
    'Milliliters',
    'Cubic Meters',
    'Cubic Feet',
    'Gallons',
    'Pints',
    'Cups',
    'Fluid Ounces'
  ];

  List<String> massUnits = [
    'Select Unit',
    'Kilograms',
    'Grams',
    'Pounds',
    'Ounces',
    'Tons',
    'Stones'
  ];

  List<String> dataUnits = [
    'Select Unit',
    'Bytes',
    'Kilobytes',
    'Megabytes',
    'Gigabytes',
    'Terabytes',
    'Petabytes',
    'Bits'
  ];

  List<String> speedUnits = [
    'Select Unit',
    'Meters per second',
    'Kilometers per hour',
    'Miles per hour',
    'Knots',
    'Feet per second'
  ];

  List<String> timeUnits = [
    'Select Unit',
    'Seconds',
    'Minutes',
    'Hours',
    'Days',
    'Weeks',
    'Months',
    'Years'
  ];

  @override
  State<UnitConverter> createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  List<String> areaUnits = [
    'Select Unit',
    'Square Meters',
    'Square Kilometers',
    'Acres',
    'Square Miles',
    'Hectares',
    'Square Feet',
    'Square Yards'
  ];

  List<String> lengthUnits = [
    'Select Unit',
    'Millimeters',
    'Centimeters',
    'Meters',
    'Kilometers',
    'Inches',
    'Feet',
    'Yards',
    'Miles',
    'Nautical Miles'
  ];

  List<String> temperatureUnits = [
    'Select Unit',
    'Celsius',
    'Fahrenheit',
    'Kelvin'
  ];

  List<String> volumeUnits = [
    'Select Unit',
    'Liters',
    'Milliliters',
    'Cubic Meters',
    'Cubic Feet',
    'Gallons',
    'Pints',
    'Cups',
    'Fluid Ounces'
  ];

  List<String> massUnits = [
    'Select Unit',
    'Kilograms',
    'Grams',
    'Pounds',
    'Ounces',
    'Tons',
    'Stones'
  ];

  List<String> dataUnits = [
    'Select Unit',
    'Bytes',
    'Kilobytes',
    'Megabytes',
    'Gigabytes',
    'Terabytes',
    'Petabytes',
    'Bits'
  ];

  List<String> speedUnits = [
    'Select Unit',
    'Meters per second',
    'Kilometers per hour',
    'Miles per hour',
    'Knots',
    'Feet per second'
  ];

  List<String> timeUnits = [
    'Select Unit',
    'Seconds',
    'Minutes',
    'Hours',
    'Days',
    'Weeks',
    'Months',
    'Years'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: widget.isLight ? Colors.black : Colors.white, // Set the back arrow color here
          ),
          title: Center(
              child: Text(
                'Unit Converter',
                style: TextStyle(
                  color: widget.isLight ?  Color(0xff164555) : Color(0xff9DD9EE),
                  fontFamily: 'Armada',
                  fontSize: 50,
                ), ) ),
          backgroundColor: widget.isLight? Colors.white70 : Colors.black87,
          bottom: TabBar(
            indicatorColor: widget.isLight ?  Color(0xff417d9b): Colors.white ,
            labelColor: widget.isLight ?  Color(0xff164555): Colors.white ,
            isScrollable: true,
            tabs: [
              Tab(text: 'Area' ,),
              Tab(text: 'Length'),
              Tab(text: 'Temperature'),
              Tab(text: 'Volume'),
              Tab(text: 'Mass'),
              Tab(text: 'Data'),
              Tab(text: 'Speed'),
              Tab(text: 'Time'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Unit(isLight: widget.isLight, unit_name: 'Area', units: areaUnits),
            Unit(isLight: widget.isLight, unit_name: 'Length', units: lengthUnits),
            Unit(isLight: widget.isLight, unit_name: 'Temperature', units: temperatureUnits),
            Unit(isLight: widget.isLight, unit_name: 'Volume', units: volumeUnits),
            Unit(isLight: widget.isLight, unit_name: 'Mass', units: massUnits),
            Unit(isLight: widget.isLight, unit_name: 'Data', units: dataUnits),
            Unit(isLight: widget.isLight, unit_name: 'Speed', units: speedUnits),
            Unit(isLight: widget.isLight, unit_name: 'Time', units: timeUnits),

          ],
        ),
        backgroundColor: widget.isLight ? Colors.white : Colors.black87,
      ),
    );
  }
}