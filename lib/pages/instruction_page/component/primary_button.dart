import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final dynamic onPress;

  PrimaryButton({required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff1B2AC2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPress,
        child: Text(text),
      ),
    );
  }
}