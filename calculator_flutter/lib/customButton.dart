import 'package:flutter/material.dart';
import 'package:neuomorphic_container/neuomorphic_container.dart';

import 'export.dart';

class CustomNumberButton extends StatelessWidget {
  final int number;
  CustomNumberButton({@required this.number});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: NeuomorphicContainer(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        alignment: Alignment.center,
        width: 80,
        height: 80,
        blur: 26,
        color: PaletteColor.primaryLightColor,
        borderRadius: BorderRadius.circular(12),
        child: Text(
          number.toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black87),
        ),
      ),
      onTap: () {
        print(number);
      },
    );
  }
}

class CustomFunctionButton extends StatelessWidget {
  final String func;

  CustomFunctionButton({@required this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: NeuomorphicContainer(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        alignment: Alignment.center,
        width: 80,
        height: 80,
        blur: 26,
        color: PaletteColor.primaryLightColor,
        borderRadius: BorderRadius.circular(12),
        child: Text(
          func,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: PaletteColor.functionLightColor),
        ),
      ),
      onTap: () {
        print(func);
      },
    );
  }
}

class CustomDecimalButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: NeuomorphicContainer(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        alignment: Alignment.center,
        width: 80,
        height: 80,
        blur: 26,
        color: PaletteColor.primaryLightColor,
        borderRadius: BorderRadius.circular(12),
        child: Text(
          ".",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: PaletteColor.functionLightColor),
        ),
      ),
      onTap: () {
        print(".");
      },
    );
  }
}

class CustomEqualButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: NeuomorphicContainer(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        alignment: Alignment.center,
        width: 190,
        height: 88,
        blur: 26,
        color: PaletteColor.primaryLightColor,
        borderRadius: BorderRadius.circular(12),
        child: Text(
          "=",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: PaletteColor.functionLightColor),
        ),
      ),
      onTap: () {
        print("=");
      },
    );
  }
}

class CustomDisplayModeButton extends StatefulWidget {
  @override
  _CustomDisplayModeButtonState createState() => _CustomDisplayModeButtonState();
}

class _CustomDisplayModeButtonState extends State<CustomDisplayModeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: NeuomorphicContainer(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          alignment: Alignment.center,
          width: 88,
          height: 88,
          blur: 26,
          color: PaletteColor.primaryLightColor,
          borderRadius: BorderRadius.circular(12),
          child: Icon(
            Icons.nights_stay_sharp,
            color: PaletteColor.functionLightColor,
            size: 32,
          )),
      onTap: () {
        print("change mode");
        setState(() {
        });
      },
    );
  }
}

class CustomClearEverythingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: NeuomorphicContainer(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        alignment: Alignment.center,
        width: 88,
        height: 88,
        blur: 26,
        color: PaletteColor.primaryLightColor,
        borderRadius: BorderRadius.circular(12),
        child: Text(
          "CE",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: PaletteColor.functionLightColor),
        ),
      ),
      onTap: () {
        print("CE");
      },
    );
  }
}
