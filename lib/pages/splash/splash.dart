import 'dart:async';

import 'package:flutter/material.dart';
import 'package:votum/pages/login_page/login_page.dart';

import '../../utils/color_palette.dart';

class Splash extends StatelessWidget {
  final _colors = ColorPalette();

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage())));
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: _colors.lightBlue,
      child: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: Image(
          image: AssetImage('Assets/images/vote.png'),
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}