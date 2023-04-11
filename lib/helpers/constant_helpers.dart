import 'package:flutter/material.dart';

class Constants {
  static const String URL = "https://randomuser.me/api/?results=10";

  BoxShadow kBoxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 8,
    offset: Offset(0, 0),
  );
}