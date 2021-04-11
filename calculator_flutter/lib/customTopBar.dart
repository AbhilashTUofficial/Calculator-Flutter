import 'package:flutter/material.dart';
import 'package:neuomorphic_container/neuomorphic_container.dart';

import 'export.dart';

class CustomTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeuomorphicContainer(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      alignment: Alignment.center,
      height: 40,
      blur: 26,
      color: PaletteColor.primaryLightColor,
      borderRadius: BorderRadius.circular(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "√x",
            style: TextStyle(
                fontSize: 18,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          Text(
            "x²",
            style: TextStyle(
                fontSize: 18,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          Text(
            "x³",
            style: TextStyle(
                fontSize: 18,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          Text(
            "x!",
            style: TextStyle(
                fontSize: 18,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          Icon(
            Icons.backspace,
            color: PaletteColor.functionLightColor,
          )
        ],
      ),
    );
  }
}
