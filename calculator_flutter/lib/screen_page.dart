import 'package:flutter/material.dart';

import 'export.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.primaryLightColor,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height-620,
          ),
          CustomTopBar(),
          Container(
            height: 466,
            child: GridView.count(
              crossAxisCount: 4,

              children: [
                CustomNumberButton(number: 7),
                CustomNumberButton(number: 8),
                CustomNumberButton(number: 9),
                CustomFunctionButton(func: "+"),
                CustomNumberButton(number: 4),
                CustomNumberButton(number: 5),
                CustomNumberButton(number: 6),
                CustomFunctionButton(func: "-"),
                CustomNumberButton(number: 1),
                CustomNumberButton(number: 2),
                CustomNumberButton(number: 3),
                CustomFunctionButton(func: "÷"),
                CustomNumberButton(number: 0),
                CustomDecimalButton(),
                CustomFunctionButton(func: "±"),
                CustomFunctionButton(func: "x"),
              ],
            ),
          ),
          Row(children: [

            CustomClearEverythingButton(),
            CustomDisplayModeButton(),
            CustomEqualButton(),
          ]),
        ],
      ),
    );
  }
}
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
