import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constants {
  static const String URL = "http://egopro1-001-site1.btempurl.com";

  static DateFormat formatter = DateFormat('dd/MM/yyyy');

  BoxShadow kBoxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 8,
    offset: Offset(0, 0),
  );
}