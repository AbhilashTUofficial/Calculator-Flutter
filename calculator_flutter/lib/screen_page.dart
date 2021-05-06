import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:neuomorphic_container/neuomorphic_container.dart';

import 'export.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String calcString = "0";

  // Calculate the value
  calculate(String input) {
    String result = "0";
    input = input.replaceAll("÷", "/");
    input = input.replaceAll("x", "*");
    try {
      Parser p = Parser();
      Expression exp = p.parse(input);

      ContextModel cm = ContextModel();
      result = '${exp.evaluate(EvaluationType.REAL, cm)}';
    } catch (e) {}
    return result;
  }

  // Calculate the cube
  calculateCube(String input) {
    var value = double.parse(calculate(input)).round();
    return pow(value, 3).toString();
  }

  // Calculate the square
  calculateSquare(String input) {
    var value = double.parse(calculate(input)).round();
    return pow(value, 2).toString();
  }

  // Calculate the Sqrt
  calculateRoot(String input) {
    var value = double.parse(calculate(input)).round();

    return sqrt(value).toString();
  }
  changeSign(String input){

  }

  // This function called whenever a button is pressed
  // Append or assign the result to the display
  numberBtnPressed(String input) {
    setState(() {
      if (calcString.length == 1 && calcString == "0" ||
          calcString.length == 1 && calcString == "") {
        calcString = input;
      } else {
        calcString += input;
      }
    });
  }

  // With a nested if-else statement determine
  // which button is pressed and which function to call.
  // I should have used switch-case statement here.
  // anyway it don't make any difference.
  funcBtnPressed(String input) {
    setState(() {
      if (input == "c") {
        calcString = calcString.substring(0, calcString.length - 1);
      } else if (input == "!") {
        var value = double.parse(calculate(calcString)).round();
        assert(value is int);
        calcString = calcFactorial(value).toString();
      } else if (input == "q") {
        calcString = calculateCube(calcString);
      } else if (input == "s") {
        calcString = calculateSquare(calcString);
      } else if (input == "r") {
        calcString = calculateRoot(calcString);
      } else if (input == "±") {
        calcString = changeSign(calcString);
      } else {
        if (input == "=") {
          calcString = calculate(calcString);
        } else if (input == "ce") {
          calcString = " ";
        } else if (!calcString.endsWith("+") &&
            !calcString.endsWith("-") &&
            !calcString.endsWith("÷") &&
            !calcString.endsWith("x") &&
            !calcString.endsWith(".") &&
            !calcString.endsWith(" ")) {
          calcString += input;
        }
      }
    });
  }

  // This return a custom build Number buttons with
  // Neuomorphics effect and the buttons also
  // bind to on press function calls.
  Widget customNumberButton({@required int number}) {
    return NeuomorphicContainer(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      alignment: Alignment.center,
      width: 80,
      height: 80,
      blur: 26,
      color: PaletteColor.primaryLightColor,
      borderRadius: BorderRadius.circular(12),
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          number.toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black87),
        ),
        onPressed: () {
          numberBtnPressed(number.toString());
        },
      ),
    );
  }

  // This return a custom build CE button with
  // Neuomorphics effect and the buttons also
  // bind to on press function calls.
  Widget customClearEverythingButton() {
    return NeuomorphicContainer(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 2 - 20,
      height: 88,
      blur: 26,
      color: PaletteColor.primaryLightColor,
      borderRadius: BorderRadius.circular(12),
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          "CE",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: PaletteColor.functionLightColor),
        ),
        onPressed: () => {funcBtnPressed("ce")},
      ),
    );
  }

  // This return a custom build Equals button with
  // Neuomorphics effect and the buttons also
  // bind to on press function calls.
  Widget customEqualButton() {
    return NeuomorphicContainer(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 2 - 20,
      height: 88,
      blur: 26,
      color: PaletteColor.primaryLightColor,
      borderRadius: BorderRadius.circular(12),
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          "=",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: PaletteColor.functionLightColor),
        ),
        onPressed: () => {funcBtnPressed("=")},
      ),
    );
  }

  // This return a custom build Function buttons with
  // Neuomorphics effect and the buttons also
  // bind to on press function calls.
  Widget customFunctionButton({@required String func}) {
    return NeuomorphicContainer(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      alignment: Alignment.center,
      width: 80,
      height: 80,
      blur: 26,
      color: PaletteColor.primaryLightColor,
      borderRadius: BorderRadius.circular(12),
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          func,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: PaletteColor.functionLightColor),
        ),
        onPressed: () {
          funcBtnPressed(func);
        },
      ),
    );
  }

  // The custom Neuomorphic bar
  // which contain the square, cube, sqrt and factorial
  // functionalities.
  Widget customTopBar() {
    return NeuomorphicContainer(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      height: 40,
      blur: 26,
      color: PaletteColor.primaryLightColor,
      borderRadius: BorderRadius.circular(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              funcBtnPressed("r");
            },
            child: Text(
              "√x",
              style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          TextButton(
            onPressed: () {
              funcBtnPressed("s");
            },
            child: Text(
              "x²",
              style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          TextButton(
            onPressed: () {
              funcBtnPressed("q");
            },
            child: Text(
              "x³",
              style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          TextButton(
            onPressed: () {
              funcBtnPressed("!");
            },
            child: Text(
              "x!",
              style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          IconButton(
            onPressed: () {
              funcBtnPressed("c");
            },
            icon: Icon(
              Icons.backspace,
              color: PaletteColor.functionLightColor,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.primaryLightColor,
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 50, right: 10),
            child: Text(
              calcString,
              style: TextStyle(fontSize: 48, color: Colors.black87),
            ),
            height: MediaQuery.of(context).size.height - 640,
          ),
          customTopBar(),
          Container(
            height: 430,
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                customNumberButton(number: 7),
                customNumberButton(number: 8),
                customNumberButton(number: 9),
                customFunctionButton(func: "+"),
                customNumberButton(number: 4),
                customNumberButton(number: 5),
                customNumberButton(number: 6),
                customFunctionButton(func: "-"),
                customNumberButton(number: 1),
                customNumberButton(number: 2),
                customNumberButton(number: 3),
                customFunctionButton(func: "÷"),
                customNumberButton(number: 0),
                customFunctionButton(func: "."),
                customFunctionButton(func: "±"),
                customFunctionButton(func: "x"),
              ],
            ),
          ),
          Row(children: [
            customClearEverythingButton(),
            customEqualButton(),
          ]),
        ],
      ),
    );
  }

  int calcFactorial(int value) {
    if (value == 1) return 1;
    return value * calcFactorial(value - 1);
  }
}

// Equivalent code for make the Neuomorphic effect
// Without using the external package.

// Container(
//   alignment: Alignment.center,
//   width: 80,
//   height: 80,
//   decoration: BoxDecoration(
//     boxShadow: [
//       BoxShadow(
//         color: Colors.white.withOpacity(0.8),
//         offset: Offset(-6.0, -6.0),
//         blurRadius: 16.0,
//       ),
//       BoxShadow(
//         color: Colors.black.withOpacity(0.1),
//         offset: Offset(6.0, 6.0),
//         blurRadius: 16.0,
//       ),
//     ],
//     color: PaletteColor.primaryColor,
//     borderRadius: BorderRadius.circular(12.0),
//   ),
//   child: Text(
//     "7",
//     style: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 32,
//         color: Colors.black87),
//   ),
// ),
